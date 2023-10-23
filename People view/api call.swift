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

