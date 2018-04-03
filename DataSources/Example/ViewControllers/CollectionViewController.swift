import UIKit
import POPDataSource

class CollectionViewController: UICollectionViewController {
    
    var shim: CollectionViewDataSourceShim! {
        didSet {
            shim.collectionView = collectionView
            collectionView?.dataSource = shim
            collectionView?.delegate = shim
        }
    }
}
