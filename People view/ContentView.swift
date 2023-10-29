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
                            Detail_View(user: user)
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
        .task {
            do{
                users = try await ApiService().getUser2()
            } catch {
                print(error.localizedDescription)
            }
        }
//            .onAppear{
//                self.users = try! await ApiService().getUser2()
//
////                apiCall().getUsers { (users) in
////                    self.users = users
////
////                }
//            }
    }
}




