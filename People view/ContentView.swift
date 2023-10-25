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
        NavigationView{
            ScrollView{
                LazyVStack{
                    ForEach(users) { user in
                        NavigationLink {
                            Detail_View()
                        } label: {
                            VStack{
                                Text(user.name)
                                HStack{
                                    Text(user.company)
                                    Text(user.address)
                                    Text(String(user.age))
                                }
                            }
                            .padding()
                        }
                    }
                }
            }
        }
            .onAppear{
                apiCall().getUsers { (users) in
                    self.users = users
                    
                }
            }
    }
}


