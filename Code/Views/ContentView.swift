//
//  NavigationBar.swift
//  ExampleApp
//
//  Created by Gautam on 05/07/23.
//

import SwiftUI

struct ContentView: View {
    @State var textValue: String = "person.fill"
    @State var showPopUp = false
    var body: some View {
        GeometryReader {geometry in
            NavigationView {
                VStack {
                    HStack{
                        SummaryTile(title: "YOU OWE", subtitle: "$345.65", color: .red)
                        Divider()
                        SummaryTile(title: "YOU ARE OWED", subtitle: "$345.65", color: .green)
                        Divider()
                        SummaryTile(title: "TOTAL BALANCE", subtitle: "$345.65", color: .green)
                        
                    }
                    .background(.white)
                    .frame(height: 60)
                    Rectangle()
                        .frame(height: 10)
                        .foregroundColor(.gray.opacity(0.2))
                        FriendsScreen()
                        CustomTabBar(tagSelect: $textValue)
                            .background(.white)
                            .ignoresSafeArea()
                    
                    
                }
//                .background(.gray.opacity(0.2))
                .navigationBarTitleTextColor(.orange)
                .navigationBarTitle("S P L I T W I S E", displayMode: .inline)
                //            .foregroundColor(.white)
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbarBackground(Color("Color"), for: .automatic)
            }
            
        }
        
        
        
    }
    
}


struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        //        @StateObject var viewRouter = ViewRouter()
        ContentView()
    }
}

//struct NavigationBar: View {
//    var body: some View {
//        TabView {
//            FriendsScreen().tabItem {
//                Image(systemName: "person")
//                Text("Friends")
//            }
//            FriendsScreen().tabItem {
//                Image(systemName: "person.2")
//                Text("Groups")
//            }
//            FriendsScreen()
//                .tabItem   {
//                    Label("Add Bill", systemImage:"plus.circle" )
//                        .font(.largeTitle)
//                }
//            FriendsScreen().tabItem {
//                Image(systemName: "newspaper")
//                Text("Activity")
//            }
//            FriendsScreen().tabItem {
//                Image(systemName: "person.crop.square.filled.and.at.rectangle")
//                Text("Me")
//            }
//        }
//    }
//}
