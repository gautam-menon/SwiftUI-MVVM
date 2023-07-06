//
//  SwiftUIView.swift
//  ExampleApp
//
//  Created by Gautam on 06/07/23.
//

import SwiftUI


@MainActor class ItemViewModel: ObservableObject {
    
    init() {
           fetchData()
       }
    @Published var listData: [ItemModel] = [
        ItemModel(name: "Richard Smith", imageUrl: "https://picsum.photos/200", amount: 523.45, isOwed: false),
        ItemModel(name: "Gloria Lopez", imageUrl: "https://picsum.photos/200", amount: 456.35, isOwed: true),
        ItemModel(name: "Levin West", imageUrl: "https://picsum.photos/200", amount: 453.60, isOwed: false),
        ItemModel(name: "Janice Stevens", imageUrl: "https://picsum.photos/200", amount: 1150.35, isOwed: true),
        ItemModel(name: "Danny Boyd", imageUrl: "https://picsum.photos/200", amount: 345.25, isOwed: false)
    ]
    
    let url:URL! = URL(string: "/data.json")
   
    func fetchData()
    {
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [ItemModel].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .eraseToAnyPublisher()
            .receive(on: DispatchQueue.main)
//            .assign(to: &listData)
    }
}
