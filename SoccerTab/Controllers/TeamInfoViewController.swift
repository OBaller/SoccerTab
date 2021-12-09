//
//  TeamInfoViewController.swift
//  SoccerTab
//
//  Created by naseem on 08/12/2021.
//

import UIKit

class TeamInfoViewController: UIViewController {
    private var teamInfo = [Competition]()

    @IBOutlet weak var playerInfoCollectionView: UICollectionView!
    @IBOutlet weak var foundedLabel: UILabel!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerInfoCollectionView.delegate = self
        playerInfoCollectionView.dataSource = self
    }

}

extension TeamInfoViewController : UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teamInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = playerInfoCollectionView.dequeueReusableCell(withReuseIdentifier: "PlayerInfoCell", for: indexPath) as! PlayerInfoCell
//        cell.configure(with: competition[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return.init(width: collectionView.frame.size.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    
}
