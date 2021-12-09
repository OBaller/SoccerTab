//
//  ClubsCell.swift
//  SoccerTab
//
//  Created by naseem on 08/12/2021.
//

import UIKit

class ClubsCell: UICollectionViewCell {
    @IBOutlet weak var clubsImage: UIImageView!
    
    func configure() {
        clubsImage.image = UIImage(systemName: "book.fill")
    }
}




