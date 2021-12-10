//
//  ViewController.swift
//  SoccerTab
//
//  Created by naseem on 08/12/2021.
//

import UIKit

class ClubsViewController: UIViewController {
    @IBOutlet weak var clubsCollectionView: UICollectionView!
     var clubVM = ClubsViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        clubVM.fetchTeamRanks()
        clubsCollectionView.delegate = self
        clubsCollectionView.dataSource = self
        clubVM.closure = {[weak self] in
            DispatchQueue.main.async {
                self?.clubsCollectionView.reloadData()
            }
        }
    }
}

extension ClubsViewController:  UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return clubVM.teams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = clubsCollectionView.dequeueReusableCell(withReuseIdentifier: "ClubsCell", for: indexPath) as! ClubsCell
        cell.configure(with: clubVM.teams[indexPath.item].team.crestUrl)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = (collectionView.frame.size.width / 3) - 15
        return.init(width: cellSize, height: cellSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let passData = clubVM.teams[indexPath.item]
        if let controller = storyboard?.instantiateViewController(withIdentifier: "TeamInfoViewController") as? TeamInfoViewController {
            controller.teamInfoVM.teamId = passData.team.id
            controller.title = passData.team.name
            controller.teamInfoVM.teamLogo = passData.team
            navigationController?.pushViewController(controller, animated: true)
        }
       
    }
}
