//
//  Detail View.swift
//  People view
//
//  Created by Ray Nahimi on 22/10/2023.
//

import SwiftUI

struct Detail_View: View {
    
    var user: User
    
    var body: some View {
        NavigationView{
            
            VStack{
                Text(user.name)
                ForEach (user.friends) { friend in
                    Text(friend.name)
                }
            }
            
        }
        
    }
}


