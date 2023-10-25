//
//  Detail View.swift
//  People view
//
//  Created by Ray Nahimi on 22/10/2023.
//

import SwiftUI

struct Detail_View: View {
    
    @State var users: [User] = []
    
    var body: some View {
        NavigationView(users){ user in
        
            
        }
        .onAppear{
            apiCall().getUsers { (users) in
                self.users = users
                
            }
        }
    }
}


