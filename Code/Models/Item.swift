//
//  Item.swift
//  ExampleApp
//
//  Created by Gautam on 05/07/23.
//

import SwiftUI

struct ItemModel:Identifiable, Codable{
    var id = UUID()
    var name:String
    var imageUrl:String
    var amount:Float
    var isOwed:Bool
}


