//
//  ListView.swift
//  ExampleApp
//
//  Created by Gautam on 05/07/23.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var viewModel: ItemViewModel = ItemViewModel()
    @State var value = false
    @State var isViewActive = false
    
    var body: some View {
        var selectedItem = viewModel.listData.first
        List(viewModel.listData) {
            item in
            Button(action: {
                isViewActive = true
                selectedItem = item
            }) {
                HStack {
                        AsyncImage(url: URL(string: item.imageUrl))
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        VStack (alignment: .leading){
                            Text(item.name)
                                .bold()
                            Text(item.isOwed ? "Owes you" : "You Owe")
                                .font(.callout)
                                .foregroundColor(.gray)
                                .bold()
                        }
                        Spacer()
                        Text(item.amount.formatted(.currency(code: "USD")))
                            .bold()
                            .foregroundColor(item.isOwed ? .green:.red)
                    }
                .sheet(isPresented: $isViewActive, onDismiss: {isViewActive = false}) {TransactionView(item: selectedItem!)}
            }
            
        }
        .listStyle(.plain)
        .onAppear{
            viewModel.fetchData()
        }
        .refreshable {
           print("Refreshing")
        }
        .frame(maxHeight: .infinity)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
