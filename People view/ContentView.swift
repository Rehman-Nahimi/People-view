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
                                    .font(.title)
                                    .bold()
                                HStack{
                                    Text(user.company)
                                    Text(String(user.age))
                                }
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 25).fill(Color.yellow))
                            .frame(width: 600, height: 80)
                            
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




