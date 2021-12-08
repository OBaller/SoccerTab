//
//  LeaguesOfDiffCountry.swift
//  SoccerTab
//
//  Created by naseem on 08/12/2021.
//

import UIKit

class LeaguesViewController : UIViewController {
    private var data: [League] = []
    @IBOutlet weak var leagueOfCountryCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = leagues
        leagueOfCountryCollectionView.delegate = self
        leagueOfCountryCollectionView.dataSource = self
    }
}

extension LeaguesViewController : UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = leagueOfCountryCollectionView.dequeueReusableCell(withReuseIdentifier: "LeagueCell", for: indexPath) as! LeagueCell
        cell.configure(with: data[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = (collectionView.frame.size.width / 3) - 15
        return.init(width: cellSize, height: cellSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    
}
