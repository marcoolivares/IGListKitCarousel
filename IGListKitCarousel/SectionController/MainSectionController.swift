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
    private var mainCellViewController = MainCellViewController()
    
    override init() {
        super.init()
        
        inset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(withNibName: "MainCell", bundle: nil, for: self, at: index) as! MainCell
        cell.configure(with: listObject?.name, controller: mainCellViewController)
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

