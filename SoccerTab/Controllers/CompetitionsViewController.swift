//
//  LeaguesOfDiffCountry.swift
//  SoccerTab
//
//  Created by naseem on 08/12/2021.
//

import UIKit

class CompetitionsViewController : UIViewController {
    private var diffLeagues = CompetitionsViewModel()
    @IBOutlet weak var leagueOfCountryCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leagueOfCountryCollectionView.delegate = self
        leagueOfCountryCollectionView.dataSource = self
        diffLeagues.fetchDifferentLeague()
        diffLeagues.closure = {[weak self] in
            DispatchQueue.main.async {
                self?.leagueOfCountryCollectionView.reloadData()
            }
        }
    }
    
}

extension CompetitionsViewController : UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return diffLeagues.competition.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("League ID:: \(diffLeagues.competition[indexPath.item].id)")
        if let clubsViewController = storyboard?.instantiateViewController(withIdentifier: "ClubsViewController") as? ClubsViewController {
            clubsViewController.clubID = diffLeagues.competition[indexPath.item].id
            navigationController?.pushViewController(clubsViewController, animated: true)
        }
             
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = leagueOfCountryCollectionView.dequeueReusableCell(withReuseIdentifier: "LeagueCell", for: indexPath) as! LeagueCell
        cell.configure(with: diffLeagues.competition[indexPath.item])
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
