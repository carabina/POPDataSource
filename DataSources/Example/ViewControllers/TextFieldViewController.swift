import UIKit

class TextFieldViewController: UITableViewController {

    var dataSource: TableViewDataSourceShim!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(cell: TextFieldTableViewCell.self)
        
        let email = TextFieldDataSource()
        email.cellConfigurator = EmailConfigurator()

//        name.placeholder = "User Name"
//        name.on(.custom(TextFieldActions.focusOn)) { cell, index, item in
//            
//        }
        
        let password = TextFieldDataSource()
        password.cellConfigurator = PasswordConfigurator()
//        password.placeholder = "Password"
//        password.on(.custom(TextFieldActions.focusOn)) { cell, index, item in
//            
//        }
        
        let composed = ComposedDataSource(dataSources:[email, password])
        self.dataSource = TableViewDataSourceShim(dataSource: composed)
        
        self.tableView.dataSource = self.dataSource
        self.tableView.delegate = self.dataSource
        
        self.tableView.reloadData()
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 140
    }
}

struct TextFieldActions {
    static let focusOn = "focusOn"
    static let distract = "distract"
    static let edit = "edit"
}

class TextFieldDataSource:
    TableViewDataSource,
    DataContainable,
    CellContainable
//    CellConfigurator,
//    CellSelectable
{
//    typealias Item = String
//    typealias Cell = TextFieldTableViewCell
//    typealias Configurator = TextFieldConfigurator
//    typealias Handler = (Cell, IndexPath, Item) -> ()
    
//    var item: Item = ""
//    var placeholder = ""

    var cellConfigurator: TextFieldConfigurator?
    
    var data: [String] = [""]

//    var selectors: [Action: Handler] = [:]
//
//    func reuseIdentifier() -> String {
//        return TextFieldTableViewCell.identifier
//    }
//    
//    func configurateCell(_ cell: Cell, item: Item, at indexPath: IndexPath) {
//        cell.textField?.text = item
//        cell.textField?.placeholder = self.placeholder
//        cell.normal()
//        cell.didBeginEditing = { [unowned cell] () in
//            cell.editing()
//            self.invoke(.custom(TextFieldActions.focusOn))?(cell, indexPath, item)
//        }
//        
//        cell.didEndEditing = { [unowned cell] () in
//            cell.normal()
//            self.invoke(.custom(TextFieldActions.distract))?(cell, indexPath, item)
//        }
//        
//        cell.shouldChangeCharacter = { [unowned cell] (range, string) in
//            cell.normal()
//            self.invoke(.custom(TextFieldActions.edit))?(cell, indexPath, item)
//            return true
//        }
//    }
}

class TextFieldConfigurator: CellConfigurator{
    typealias Item = String
    typealias Cell = TextFieldTableViewCell
    
    func reuseIdentifier() -> String {
        return TextFieldTableViewCell.identifier
    }
    func configurateCell(_ cell: Cell, item: Item, at indexPath: IndexPath) {
    }
}

class PasswordConfigurator: TextFieldConfigurator {
  override  func configurateCell(_ cell: Cell, item: Item, at indexPath: IndexPath) {
        cell.textField?.text = item
        cell.textField?.placeholder = "Password"
        cell.textField?.autocorrectionType = .no
        cell.textField?.autocapitalizationType = .none
        cell.textField?.isSecureTextEntry = true
    }
}

class EmailConfigurator: TextFieldConfigurator {
  override  func configurateCell(_ cell: Cell, item: Item, at indexPath: IndexPath) {
        cell.textField?.text = item
        cell.textField?.placeholder = "Email"
        cell.textField?.autocorrectionType = .no
        cell.textField?.autocapitalizationType = .words
        cell.textField?.isSecureTextEntry = false
    }
}

//struct PasswordConfigurator: CellConfigurator {
//    
//    typealias Item = String
//    typealias Cell = TextFieldTableViewCell
//    
//    func reuseIdentifier() -> String {
//        return TextFieldTableViewCell.identifier
//    }
//    
//    func configurateCell(_ cell: Cell, item: Item, at indexPath: IndexPath) {
//        cell.textField?.text = item
//        
//        cell.textField?.autocorrectionType = .no
//        cell.textField?.autocapitalizationType = .none
//        cell.textField?.isSecureTextEntry = true
////        
////        
//////        cell.textField?.placeholder = self.placeholder
////        cell.normal()
////        cell.didBeginEditing = { [unowned cell] () in
////            cell.editing()
//////            self.invoke(.custom(TextFieldActions.focusOn))?(cell, indexPath, item)
////        }
////        
////        cell.didEndEditing = { [unowned cell] () in
////            cell.normal()
//////            self.invoke(.custom(TextFieldActions.distract))?(cell, indexPath, item)
////        }
////        
////        cell.shouldChangeCharacter = { [unowned cell] (range, string) in
////            cell.normal()
//////            self.invoke(.custom(TextFieldActions.edit))?(cell, indexPath, item)
////            return true
////        }
//    }
//}

