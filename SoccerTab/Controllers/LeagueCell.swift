//
//  LeagueOfCountryCell.swift
//  SoccerTab
//
//  Created by naseem on 08/12/2021.
//

import UIKit

class LeagueCell : UICollectionViewCell {
    @IBOutlet weak var leagueNameLabel : UILabel!
    @IBOutlet weak var countryNameLabel : UILabel!
    @IBOutlet weak var dateLabel : UILabel!    
    
    func configure (with model: League){
        leagueNameLabel.text = model.leagueName
        countryNameLabel.text = model.countryName
        dateLabel.text = model.date
    }
    
}
