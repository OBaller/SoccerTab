//
//  ClubsCell.swift
//  SoccerTab
//
//  Created by naseem on 08/12/2021.
//

import UIKit
import SDWebImageSVGCoder

class ClubsCell: UICollectionViewCell {
    @IBOutlet weak var clubsImage: UIImageView!
    
    func configure(with model: String) {
        clubsImage.sd_setImage(with: URL(string: model))
    }
}




