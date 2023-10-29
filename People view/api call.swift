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

class apiCall2 {
    
    func getuser2() async throws -> User{
        let endpoint = "https://www.hackingwithswift.com/samples/friendface.json"
        
        guard let url = URL(string: endpoint) else { throw tsError.invalidURL}
        
        let(data, response) = try await URLSession.shared.data(from: url )
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw tsError.invalidResponse
        }
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(User.self, from: data)
        } catch {
            throw tsError.invalidData
        }
    }
    
    enum tsError: Error{
        case invalidURL
        case invalidResponse
        case invalidData
    }
}
