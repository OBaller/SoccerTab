//
//  PlayerInfoViewModel.swift
//  SoccerTab
//
//  Created by naseem on 09/12/2021.
//

import Foundation
class CompetitionsViewModel {
    private let service = Service()
    var competition = [Competition]()
    var closure: (() -> ())?
        let urlString = "https://api.football-data.org/v2/competitions"
        let token = "cc8dd01fcd8648d680bd416224f0106b"
       let header = "X-Auth-Token"
    func fetchDifferentLeague () {
        service.fetchLeagueCompetitions(head: .header, token: token, header: header, urlString: urlString) { leagueData, error in
            if let err = error {
                print("Error::::: \(err)")
            } else {
                self.competition = leagueData?.competitions ?? []
                self.closure?()
            }
        }
    }
}
