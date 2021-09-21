//
//  Constant.swift
//  Touchdown
//
//  Created by Ryan J.W. Kim on 2021/09/17.
//

import SwiftUI


// DATA

let players: [Player] = Bundle.main.decode("player.json")
let categories: [Category] = Bundle.main.decode("category.json")
let products: [Product] = Bundle.main.decode("product.json")

// COLOR
let colorBackground: Color = Color("colorBackground")
let colorGray: Color = Color(UIColor.systemGray)


// LAYOUT

let columnSpacing: CGFloat = 10
let rowSpacing: CGFloat = 10
var gridLayout: [GridItem] {
    return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 2)
}

// UX


// API


// IMAGE


// FONT
 

// STRING


// MISC


