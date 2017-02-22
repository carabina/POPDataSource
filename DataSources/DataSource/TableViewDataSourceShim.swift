import UIKit

class TableViewDataSourceShim: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var dataSource: TableViewDataSource    
    
    init(dataSource: TableViewDataSource) {
        self.dataSource = dataSource
    }
    
    open func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.numberOfSections(for: tableView)
    }
    
    open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return dataSource.cellHeight(for: tableView, at: indexPath)
    }
    
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.numberOfRows(for: tableView, in: section)
    }
    
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return dataSource.cell(for: tableView, at: indexPath)
    }

    open func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataSource.headerTitle(for: tableView, in: section)
    }
    
    open func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return dataSource.footerTitle(for: tableView, in: section)
    }
    
    open func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return dataSource.headerHeight(for: tableView, in: section)
    }
 
    open func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return dataSource.footerHeight(for: tableView, in: section)
    }
    
    open func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return dataSource.headerView(for: tableView, in: section)
    }
    
    open func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return dataSource.footerView(for: tableView, in: section)
    }
    
    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataSource.didSelectRow(in: tableView, at: indexPath)
    }
    
    open func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        dataSource.didHighlightRow(in: tableView, at: indexPath)
    }
    
    open func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        dataSource.didUnhighlightRow(in: tableView, at: indexPath)
    }
}

class SegmentDataSourceShim: TableViewDataSourceShim {
    
    private var dataSources: [TableViewDataSource]
    private var _selectedIndex = 0

    var tableView: UITableView?
    
    var selectedIndex: Int {
        get {
            return _selectedIndex
        }
        
        set {
            selectIndex(newValue)
        }
    }
    
    init(_ dataSources: [TableViewDataSource]) {
        self.dataSources = dataSources
        super.init(dataSource: dataSources[0])
    }
    
    func selectIndex(_ index: Int) {
        
        _selectedIndex = index
        if index >= 0 && index < self.dataSources.count {
            self.dataSource = self.dataSources[index]
            tableView?.reloadData()
        }
    }

}
