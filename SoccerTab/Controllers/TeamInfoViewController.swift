//
//  TeamInfoViewController.swift
//  SoccerTab
//
//  Created by naseem on 08/12/2021.
//

import UIKit

class TeamInfoViewController: UIViewController {
    var teamInfoVM = TeamPlayerViewModel()
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var playerInfoCollectionView: UICollectionView!
    @IBOutlet weak var foundedLabel: UILabel!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        scrollView.bounds = view.bounds
//        scrollView.isUserInteractionEnabled = true
//        scrollView.isScrollEnabled = true
        teamInfoVM.fetchTeamPlayers()
        playerInfoCollectionView.delegate = self
        playerInfoCollectionView.dataSource = self
        teamInfoVM.closure = {[weak self] in
            DispatchQueue.main.async {
                self?.playerInfoCollectionView.reloadData()
            }
        }
    }
}

extension TeamInfoViewController : UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teamInfoVM.teamPlayers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = playerInfoCollectionView.dequeueReusableCell(withReuseIdentifier: "PlayerInfoCell", for: indexPath) as! PlayerInfoCell
        cell.configure(with: teamInfoVM.teamPlayers[indexPath.item])
//        cell.configure(with: clubVM.teams[indexPath.item].team.crestUrl)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return.init(width: collectionView.frame.size.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    
}
