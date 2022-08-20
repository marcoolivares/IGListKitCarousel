//
//  ViewController.swift
//  IGListKitCarousel
//
//  Created by Marco Olivares on 19/08/22.
//

import UIKit
import IGListKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var adapter: ListAdapter = {
        let updater = ListAdapterUpdater()
        let adapter = ListAdapter(updater: updater, viewController: self, workingRangeSize: 0)
        adapter.collectionView = collectionView
        adapter.dataSource = self
        return adapter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = adapter
    }

}

extension ViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        let data: [ListObject] = [ListObject(id: "1", name: "Object 1"),
                                  ListObject(id: "2", name: "Object 2"),
                                  ListObject(id: "3", name: "Object 3"),
                                  ListObject(id: "4", name: "Object 4"),
                                  ListObject(id: "5", name: "Object 5")]
        return data
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return MainSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
