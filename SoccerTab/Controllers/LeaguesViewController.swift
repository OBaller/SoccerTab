//
//  LeaguesOfDiffCountry.swift
//  SoccerTab
//
//  Created by naseem on 08/12/2021.
//

import UIKit

class LeaguesViewController : UIViewController {
    private var competition = [Competition]()
    @IBOutlet weak var leagueOfCountryCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leagueOfCountryCollectionView.delegate = self
        leagueOfCountryCollectionView.dataSource = self
        fetchCompetition()
    }
    func fetchCompetition() {
        CompetitionService.shared.fetchLeagues { (results, error) in
            if let error = error {
              print("Failed to fetch football data", error)
                return
            }
            self.competition = results
            DispatchQueue.main.async {
                self.leagueOfCountryCollectionView.reloadData()
            }
        }
    }
}

extension LeaguesViewController : UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return competition.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = leagueOfCountryCollectionView.dequeueReusableCell(withReuseIdentifier: "LeagueCell", for: indexPath) as! LeagueCell
        cell.configure(with: competition[indexPath.item])
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
