//
//  Service.swift
//  SoccerTab
//
//  Created by naseem on 09/12/2021.
//

import Foundation
class Service {
    func fetchTeamPlayers (head: Token, token: String?, header: String?, urlString: String, completion: @escaping (Teamplayers?, Error?)->Void) {
        fetchGenericJSON(head:head, token:token, header: header, urlString: urlString, completion:  completion)
    }
    func fetchTeamRank(head: Token, token: String?, header: String?, urlString: String, completion: @escaping (TeamRankModel?, Error?)->Void) {
        fetchGenericJSON(head:head, token:token, header: header, urlString: urlString, completion:  completion)
    }
    func fetchLeagueCompetitions (head: Token, token: String?, header: String?, urlString: String,completion: @escaping (CompetitionsModel?, Error?)->Void) {
        fetchGenericJSON(head: head, token: token, header: token, urlString: urlString, completion: completion)
    }
    func fetchGenericJSON <T: Decodable>(head: Token, token: String?, header: String?, urlString: String, completion: @escaping (T?, Error?)->Void) {
        guard let url = URL(string: urlString) else { return }
        switch head {
            case .header:
                var request = URLRequest(url: url)
                request.setValue(token!, forHTTPHeaderField: header!)
                URLSession.shared.dataTask(with: request){ data, resp, err in
                    if let err = err {
                        completion(nil, err)
                        return
                    }
                    guard let data = data else { return }
                    do {
                        let decoder = JSONDecoder()
                        decoder.dateDecodingStrategy = .iso8601
                        let objects = try decoder.decode(T.self, from: data)
                        completion(objects, nil)
                    } catch {
                        completion(nil, error)
                    }
                }.resume()
            case .noHeader:
                URLSession.shared.dataTask(with: url){ data, resp, err in
                    if let err = err {
                        completion(nil, err)
                        return
                    }
                    guard let data = data else { return }
                    do {
                        let objects = try JSONDecoder().decode(T.self, from: data)
                        completion(objects, nil)
                    } catch {
                        completion(nil, error)
                    }
                }.resume()
            default:
                print("Testing HTTP Codes")
        }
    }
}
enum Token {
    case header
    case noHeader
}
