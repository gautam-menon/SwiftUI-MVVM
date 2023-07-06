//
//  TransactionView.swift
//  Finance_example
//
//  Created by Gautam on 09/12/22.
//

import SwiftUI

struct TransactionView: View {
    let  item: ItemModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        NavigationView {
            VStack(spacing: 20) {
                AsyncImage(url: URL(string: item.imageUrl))
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                DetailsTile(title: "Name", content: item.name);
                DetailsTile(title: "Amount", content: "\(item.amount)")
                DetailsTile(title: "Quote", content: item.isOwed ? "You Owe" : "You Are Owed")
            }

        }
        
    }
}

struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionView( item:  ItemViewModel().listData.first!)
    }
}

struct DetailsTile: View {
    let title: String
    let content: String
    var body: some View {
        VStack{
            Text(title)
                .foregroundColor(.gray)
                .font(.title3)
            Text(content)
                .font(.title2)
                .fontWeight(.bold)
        }
    }
}
