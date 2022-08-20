//
//  CarouselSectionController.swift
//  IGListKitCarousel
//
//  Created by Marco Olivares on 19/08/22.
//

import Foundation
import IGListKit


class CarouselSectionController: ListSectionController {
    
    private var listObject: ListObject?

    override init() {
        super.init()
        
        inset = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20)
    }

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(withNibName: "CarouselCell", bundle: nil, for: self, at: index) as! CarouselCell
        cell.configure(with: listObject?.name)
        return cell
    }

    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width-80, height: collectionContext!.containerSize.height-80)
    }

    override func didSelectItem(at index: Int) {
        print("Selected: \(String(describing: listObject?.name))")
    }

    override func didUpdate(to object: Any) {
        self.listObject = object as? ListObject
    }
}
