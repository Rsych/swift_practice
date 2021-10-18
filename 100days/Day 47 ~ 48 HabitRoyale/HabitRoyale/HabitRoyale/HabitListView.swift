//
//  HabitListView.swift
//  HabitRoyale
//
//  Created by Ryan J. W. Kim on 2021/10/18.
//

import SwiftUI

struct HabitListView: View {
    // MARK: - Properties
    
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            List {
                ForEach(1..<10) { i in
                    HStack{
                        VStack(alignment: .leading, spacing: 0, content: {
                            Text("\(i) name")
                            Text("\(i) type")
                        })//: VStack
                        Spacer()
                        VStack{
                            Text("\(i)% done")
                            Text("\(i) Finished")
                        }
                    } //: Hstack
                } //: Loop
                
            } //: List
            .listStyle(.sidebar)
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }//: Edit
                ToolbarItem(placement: .navigationBarTrailing) {
                    // add function
                    Image(systemName: "plus")
                }
            }
        } //: NavigationView
    }
}

// MARK: - Preview
struct HabitListView_Previews: PreviewProvider {
    static var previews: some View {
        HabitListView()
            .previewDevice("iPhone 11")
    }
}
