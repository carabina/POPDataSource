import UIKit
import ReactiveCocoa
import ReactiveSwift

class TextFieldViewController: UITableViewController {

    private var name = NameDataSource()
    private var surname = SurnameDataSource()
    private var email = EmailDataSource()
    private var password = PasswordDataSource()
    
    private var dataSource: TableViewDataSourceShim? = nil {
        didSet {
            tableView.dataSource = dataSource
            tableView.delegate = dataSource
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(cell: TextFieldTableViewCell.self)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        
        setupDataSource()
    }
    
    private func setupDataSource() {
        name.on(.custom(TextFieldDataSource.Actions.end)) { cell, _, _ in
            print("Name end editing: " + (cell.textField?.text ?? ""))
        }
        
        surname.on(.custom(TextFieldDataSource.Actions.end)) { cell, _, _ in
            print("Surname end editing: " + (cell.textField?.text ?? ""))
        }
        
        email.on(.custom(TextFieldDataSource.Actions.end)) { cell, _, _ in
            print("Email end editing: " + (cell.textField?.text ?? ""))
        }
    
        password.on(.custom(TextFieldDataSource.Actions.end)) { cell, _, _ in
            print("Password end editing: " + (cell.textField?.text ?? ""))
        }
        
        let compossed = ComposedDataSource(dataSources:[name, surname, email, password])
        dataSource = TableViewDataSourceShim(dataSource: compossed)
    }
}



