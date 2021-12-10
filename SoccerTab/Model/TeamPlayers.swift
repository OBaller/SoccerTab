//
//  TeamPlayers.swift
//  SoccerTab
//
//  Created by naseem on 10/12/2021.
//

import Foundation

struct Teamplayers: Codable {
    let id: Int
    var crestUrl: String?
    let squad: [Squad]
}

struct Squad: Codable {
    let id: Int
    var name: String?
    var position: String?
}
