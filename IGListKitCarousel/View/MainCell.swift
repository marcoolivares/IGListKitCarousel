//
//  MainCell.swift
//  IGListKitCarousel
//
//  Created by Marco Olivares on 19/08/22.
//

import UIKit
import IGListKit

class MainCell: UICollectionViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var adapter: ListAdapter?
    var controller: MainCellViewController?
    
    func configure(with text: String?, controller: MainCellViewController) {
        let adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: controller)
        adapter.collectionView = collectionView
        adapter.dataSource = controller
        self.adapter = adapter
    }
}

class MainCellViewController: UIViewController, ListAdapterDataSource {
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        let data: [ListObject] = [ListObject(id: "6", name: "Sub-Object 1"),
                                  ListObject(id: "7", name: "Sub-Object 2"),
                                  ListObject(id: "8", name: "Sub-Object 3"),
                                  ListObject(id: "9", name: "Sub-Object 4"),
                                  ListObject(id: "10", name: "Sub-Object 5")]
        return data
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return CarouselSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
