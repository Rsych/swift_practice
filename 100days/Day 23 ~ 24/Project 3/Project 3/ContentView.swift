//
//  ContentView.swift
//  Project 3
//
//  Created by Ryan J. W. Kim on 2021/10/01.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        Button("Hello World") {
            print(type(of: self.body))
        }
        .frame(width: 200, height: 200, alignment: .center)
        .background(Color.red)
        .padding()
        .background(Color.yellow)
        .padding()
        .background(Color.blue)
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
