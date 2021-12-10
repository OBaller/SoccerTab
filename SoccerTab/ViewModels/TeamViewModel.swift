//
//  TeamsViewModel.swift
//  SoccerTab
//
//  Created by naseem on 09/12/2021.
//

import Foundation

class TeamPlayerViewModel {
    private let service = Service()
    
    var teamPlayers = [Squad]()
    var closure: (()->())?
    var teamId = 0
    var teamLogo: Team?
    
    func fetchTeamPlayers () {
        let urlString = "https://api.football-data.org/v2/teams/\(teamId)"
        let token = "cc8dd01fcd8648d680bd416224f0106b"
        let header = "X-Auth-Token"
        service.fetchTeamPlayers(head: .header, token: token, header: header, urlString: urlString) { teamPlayer, error in
            if let err = error {
                print("Error:::: \(err)")
            } else {
                self.teamPlayers = teamPlayer?.squad ?? []
                self.closure?()
            }
            
        }
    }
    
    
}
