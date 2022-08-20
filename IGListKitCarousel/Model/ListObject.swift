//
//  ListObject.swift
//  IGListKitCarousel
//
//  Created by Marco Olivares on 19/08/22.
//

import Foundation
import IGListKit

final class ListObject {
    
    let name: String
    let id: String
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}

extension ListObject: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return id as NSString
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? ListObject else {
            return false
        }
        return self.id == object.id
    }
}
