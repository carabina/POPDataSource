import POPDataSource

class SegmentTableViewController: UITableViewController {
    
    @IBOutlet weak var segment: UISegmentedControl?
    
    var segmentShim: SegmentDataSourceShim!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(CustomeSection.self)
        
        let artists = ComposedDataSource(LedZeppelin.artists)
        let genres = GenresDataSource()
        
        self.segmentShim = SegmentDataSourceShim([artists, genres])
 
        self.segmentShim.tableView = self.tableView
        self.tableView.dataSource = self.segmentShim
        self.tableView.delegate = self.segmentShim
        
        self.segment?.addTarget(self, action: #selector(SegmentTableViewController.select(segment:)), for: .valueChanged)
    }
    
    func select(segment: UISegmentedControl) {
        self.segmentShim.selectIndex(segment.selectedSegmentIndex)
    }
}
