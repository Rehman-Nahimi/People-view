//
//  ContentView.swift
//  People view
//
//  Created by Ray Nahimi on 22/10/2023.
//

import SwiftUI



struct ContentView: View {
    
    @State var users: [User] = []
    
    var body: some View {
        List(users) { user in
            Text(user.name)
            
            
        }
            .onAppear{
                apiCall().getUsers { (users) in
                    self.users = users
                    
                }
            }
    }
}


