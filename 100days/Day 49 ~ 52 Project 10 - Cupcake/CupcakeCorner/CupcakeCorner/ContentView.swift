//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Ryan J. W. Kim on 2021/10/19.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Preview
    
    // MARK: - Body
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
    }
}
