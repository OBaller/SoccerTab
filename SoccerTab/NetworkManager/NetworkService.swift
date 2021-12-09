//
//  NetworkService.swift
//  SoccerTab
//
//  Created by naseem on 09/12/2021.
//

import Foundation

class CompetitionService {
    static let shared = CompetitionService()
    
    func fetchLeagues(completion: @escaping ([Competition], Error?) -> () ) {
        // URL
        let url = URL(string: "https://api.football-data.org/v2/competitions")
        guard url != nil else {
            print("error creating url object")
            return
        }
        // URL Request
        var request = URLRequest(url: url!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        // Specify the header
        let header = ["X-Auth-Token": "cc8dd01fcd8648d680bd416224f0106b", "accept": "string", "content-type": "application/json"]
        request.allHTTPHeaderFields = header
        request.httpMethod = "GET"
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { data, response, error in
            if error == nil && data != nil {
                guard let data = data else {return}
                
                do {
                    let jsonDecoder = try
                    JSONDecoder().decode(CompetitionsModel.self, from: data)
                    completion(jsonDecoder.competitions , error)
                    
                } catch let jsonErr {
                    print("failed to decode json data", jsonErr)
                    completion([], error)
                }
            }
        }
        dataTask.resume()
        
    }
}
