//
//  ClubsViewModel.swift
//  SoccerTab
//
//  Created by naseem on 09/12/2021.
//

import Foundation

class ClubsViewModel {
    var clubID: Int?
    private let service = Service()
    var teams = [TeamPosition]()
    var closure: (()->())?
    private  let token = "cc8dd01fcd8648d680bd416224f0106b"
    private let header = "X-Auth-Token"
    func fetchTeamRanks () {
        let urlString = "https://api.football-data.org/v2/competitions/\(clubID ?? 2021)/standings"
        service.fetchTeamRank(head: .header, token: token, header: header, urlString: urlString) { teamRank, error in
            if let err = error {
                print("Error fetching TeamRanks:: \(err)")
            } else {
                self.teams = teamRank?.standings[0].table ?? []
                self.closure?()
            }
        }
    }
}
