//
//  ContentView.swift
//  ExampleApp
//
//  Created by Gautam on 05/07/23.
//

import SwiftUI
import CoreData

struct FriendsScreen: View {
    @Environment(\.managedObjectContext) private var viewContext
   
    
    var body: some View {
        NavigationView {
            VStack {
                ListView()
                    .frame(height: 400)
                Button(action: {
                        print("Hello button tapped!")
                    }) {
                        Text("+ Add more friends")
                            
                            .bold()
                            .foregroundColor(.green)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.green, lineWidth: 3)
                            )
                    }
                    .padding()
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(.clear)
                Spacer()
            }
        }
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        FriendsScreen()
    }
}
