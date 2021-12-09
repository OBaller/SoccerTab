//
//  ViewController.swift
//  SoccerTab
//
//  Created by naseem on 08/12/2021.
//

import UIKit

class ClubsViewController: UIViewController {
    @IBOutlet weak var clubsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clubsCollectionView.delegate = self
        clubsCollectionView.dataSource = self
    }


}

extension ClubsViewController:  UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = clubsCollectionView.dequeueReusableCell(withReuseIdentifier: "ClubsCell", for: indexPath) as! ClubsCell
        cell.configure()
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

