import UIKit

public protocol TableViewDataSource {
    /**
     *  Base methods
     */
    func numberOfSections(for tableView: UITableView) -> Int
    
    func numberOfRows(for tableView: UITableView, in section: Int) -> Int
    
    func cellHeight(for tableView: UITableView, at indexPath: IndexPath) -> CGFloat

    func cell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell
    
    /**
     *  Section configurator methods
     */
    func headerTitle(for tableView: UITableView, in section: Int) -> String?
    
    func footerTitle(for tableView: UITableView, in section: Int) -> String?
    
    func headerHeight(for tableView: UITableView, in section: Int) -> CGFloat
    
    func footerHeight(for tableView: UITableView, in section: Int) -> CGFloat
    
    func headerView(for tableView: UITableView, in section: Int) -> UIView?
    
    func footerView(for tableView: UITableView, in section: Int) -> UIView?
    
    /**
     *  Selectors
     */
    func didSelectRow(in tableView: UITableView, at indexPath: IndexPath)
    
    func didHighlightRow(in tableView: UITableView, at indexPath: IndexPath)
    
    func didUnhighlightRow(in tableView: UITableView, at indexPath: IndexPath)
}

/**
 *  Optional methods
 */
public extension TableViewDataSource {
    
    func numberOfSections(for tableView: UITableView) -> Int {
        return 1
    }
    
    func cellHeight(for tableView: UITableView, at indexPath: IndexPath) -> CGFloat {
        return 0
    }
    
    func headerTitle(for tableView: UITableView, in section: Int) -> String? {
        return nil
    }
    
    func footerTitle(for tableView: UITableView, in section: Int) -> String? {
        return nil
    }
    
    func headerHeight(for tableView: UITableView, in section: Int) -> CGFloat {
        return 0
    }
    
    func footerHeight(for tableView: UITableView, in section: Int) -> CGFloat {
        return 0
    }
    
    func headerView(for tableView: UITableView, in section: Int) -> UIView? {
        return nil
    }
    
    func footerView(for tableView: UITableView, in section: Int) -> UIView? {
        return nil
    }
    
    func didSelectRow(in tableView: UITableView, at indexPath: IndexPath) {
    }
    
    func didHighlightRow(in tableView: UITableView, at indexPath: IndexPath) {
    }
    
    func didUnhighlightRow(in tableView: UITableView, at indexPath: IndexPath) {
    }
}
