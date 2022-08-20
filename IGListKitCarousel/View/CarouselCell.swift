//
//  CarouselCell.swift
//  IGListKitCarousel
//
//  Created by Marco Olivares on 19/08/22.
//

import UIKit

class CarouselCell: UICollectionViewCell {

    @IBOutlet weak var carouselLabel: UILabel!
    
    func configure(with text: String?) {
        carouselLabel.text = text
    }
}
