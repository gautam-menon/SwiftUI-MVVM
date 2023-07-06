//
//  SummaryView.swift
//  ExampleApp
//
//  Created by Gautam on 06/07/23.
//

import SwiftUI

struct SummaryTile: View {
    let title:String
    let subtitle:String
    let color: Color
    var body: some View {
        
        VStack {
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
                .bold()
            Spacer()
                .frame(height:2)
            Text("$345.34")
                .foregroundColor(color)
                .bold()
        }
        .frame(maxWidth: .infinity)
    }
}
