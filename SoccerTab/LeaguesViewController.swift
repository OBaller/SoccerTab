//
//  LeaguesOfDiffCountry.swift
//  SoccerTab
//
//  Created by IBE on 08/12/2021.
//

import UIKit

class LeaguesViewController : UIViewController {
    @IBOutlet weak var leagueOfCountryCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leagueOfCountryCollectionView.delegate = self
        leagueOfCountryCollectionView.dataSource = self
    }
}

extension LeaguesViewController : UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = leagueOfCountryCollectionView.dequeueReusableCell(withReuseIdentifier: "LeagueCell", for: indexPath) as! LeagueCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return.init(width: 100, height: 100)
    }
    
    
}
