//
//  api call.swift
//  People view
//
//  Created by Ray Nahimi on 22/10/2023.
//

import Foundation


class apiCall {
    
    func getUsers(completion:@escaping ([User]) -> ()) {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
                let users = try! JSONDecoder().decode([User].self, from: data!)
                
            
                DispatchQueue.main.async {
                    completion(users)
                }
            }
            .resume()
        }
        
    }

class ApiService {
    
    func getUser2() async throws -> [User]{
        let endpoint = "https://www.hackingwithswift.com/samples/friendface.json"
        
        guard let url = URL(string: endpoint) else { throw TSError.invalidURL}
        
        let(data, response) = try await URLSession.shared.data(from: url )
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw TSError.invalidResponse
        }
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode([User].self, from: data)
        } catch {
            throw TSError.invalidData
        }
    }
    
    enum TSError: Error{
        case invalidURL
        case invalidResponse
        case invalidData
    }
}
