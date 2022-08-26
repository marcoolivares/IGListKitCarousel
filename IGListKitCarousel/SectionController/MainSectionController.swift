//
//  MainSectionController.swift
//  IGListKitCarousel
//
//  Created by Marco Olivares on 19/08/22.
//

import Foundation
import IGListKit

final class MainSectionController: ListSectionController {
    
    private var listObject: ListObject?
    private lazy var adapter: ListAdapter = {
        let adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self.viewController)
        adapter.dataSource = self
        return adapter
    }()
    
    override init() {
        super.init()
        
        inset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(withNibName: "MainCell", bundle: nil, for: self, at: index) as! MainCell
        cell.configure(with: listObject?.name)
        if adapter.collectionView == nil {
            adapter.collectionView = cell.collectionView
        }
        return cell
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width-10, height: 200)
    }
    
    override func didSelectItem(at index: Int) {
        print("Selected: \(String(describing: listObject?.name))")
    }
    
    override func didUpdate(to object: Any) {
        self.listObject = object as? ListObject
    }
}

extension MainSectionController: ListAdapterDataSource {
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

