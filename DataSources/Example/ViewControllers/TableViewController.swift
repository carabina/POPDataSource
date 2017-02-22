import UIKit

class TableViewController: UITableViewController {
    
    var dataSource: TableViewDataSourceShim!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(CustomeSection.self)
        
        self.tableView.dataSource = self.dataSource
        self.tableView.delegate = self.dataSource
    }
}

