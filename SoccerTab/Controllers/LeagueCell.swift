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
    
    func configure (with model: Competition){
        leagueNameLabel.text = model.name
        countryNameLabel.text = model.area.name
        dateLabel.text = model.currentSeason?.startDate
    }
    
}
