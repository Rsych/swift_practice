//
//  ContentView.swift
//  WordScramble
//
//  Created by Ryan J. W. Kim on 2021/10/06.
//

import SwiftUI

struct ListView: View {
    // MARK: - Properties
    let people = ["Finn", "Leia", "Luke", "Rey"]
    // MARK: - Body
    var body: some View {
        VStack {
            List{
                Section {
                    Text("Hello world")
                } header: {
                    Text("Section 1")
                } //: Section1
                Section {
                    Text("Hello 2")
                } header: {
                    Text("Section 2")
                } //: Section2
                Section{
                ForEach(0..<3) { i in
                    Text("Hello this is \(i)")
                } //: Loop
                } header: {
                    Text("Section 3")
                } //: Section3
                Section{
                ForEach(0..<5) {
                    Text("This is \($0)")
                } //: Loop
                } header: {
                    Text("Section4")
                } //: Section4
            } //: List
            .listStyle(.grouped)
            
            List(people, id: \.self) {
                Text($0)
            }
        } //: Vstack
        
    } //: body
} //: content view

// MARK: - Preview
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .previewDevice("iPhone 13")
    }
}
