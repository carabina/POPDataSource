import UIKit

public enum HeaderFooterView <Section: UIView>{
    case title(String)
    case view((Section, Int) -> ())
    case none
}

public enum Action {
    case select
    case highlight
    case unhighlight
    case custom(String)
}

extension Action: Hashable, Equatable {
    public var hashValue: Int {
        switch self {
        case .select: return 1
        case .highlight: return 2
        case .unhighlight: return 3
        case .custom(let x): return 4 + x.hashValue
        }
    }
    
    public static func ==(lhs: Action, rhs: Action) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}


/**
 *  Cell
 */
public protocol CellContainable {
    associatedtype Configurator: CellConfigurator
    
    var cellConfigurator: Configurator? { get }
}

/**
 *  Cell configurator
 */
public protocol CellConfigurator {
    associatedtype Item
    associatedtype Cell: UITableViewCell

    func reuseIdentifier() -> String
    
    func configurateCell(_ cell: Cell, item: Item, at indexPath: IndexPath)
}

/**
 * Selectable Cell
 */
public protocol CellSelectable: CellConfigurator {
    typealias Handler = (Cell, IndexPath, Item) -> ()
    
    var selectors: [Action: Handler] { get set }
}

public extension CellSelectable {
    
    func invoke(_ action: Action) -> Handler? {
        return self.selectors[action]
    }
    
    mutating func on(_ action: Action, handler: @escaping Handler) {
        self.selectors[action] = handler
    }
}

/**
 *  Section
 */
public protocol HeaderContainable {
    associatedtype Header: SectionConfigurator
    
    var header: Header? { get }
}

public protocol FooterContainable {
    associatedtype Footer: SectionConfigurator
    
    var footer: Footer? { get }
}

/**
 *  Section configurator
 */
public protocol SectionConfigurator {
    associatedtype SectionView: UIView
    
    func section() -> HeaderFooterView<SectionView>
}

/**
 * Selectable Section
 */
public protocol SectionSelectable: SectionConfigurator {
    typealias Handler = (SectionView, Int) -> ()

    var selectors: [Action: Handler] { get set }
}

public extension SectionSelectable {
    
    func invoke(_ action: Action) -> Handler? {
        return self.selectors[action]
    }
    
    mutating func on(_ action: Action, handler: @escaping Handler) {
        self.selectors[action] = handler
    }
}
