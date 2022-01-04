//
//  ContentView.swift
//  Project 3
//
//  Created by Ryan J. W. Kim on 2021/10/01.
//

import SwiftUI
struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0 ..< rows) { row in
                HStack {
                    ForEach(0 ..< self.columns) { column in
                        self.content(row, columns)
                    }
                }
            }
        }
    }
    // adding init allow us making closures
    init(rows: Int, columns: Int, @ViewBuilder content: @escaping(Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
}
struct ContentView: View {
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        VStack{
            GridStack(rows: 4, columns: 4) { row, col in
                HStack {
                    Image(systemName: "\(row * 4 + col).circle")
                    Text("R\(row) C\(col)")
                }
            }
            
            GridStack(rows: 4 , columns: 4) { row, col in
                Image(systemName: "clock")
                Text("R\(row), C\(col)")
            }
        }
    }
    
    // MARK: - Preview
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
