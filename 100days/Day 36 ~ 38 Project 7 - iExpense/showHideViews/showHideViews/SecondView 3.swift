//
//  SecondView.swift
//  showHideViews
//
//  Created by Ryan J. W. Kim on 2021/10/09.
//

import SwiftUI

struct SecondView: View {
    // MARK: - Properties
    @Environment(\.presentationMode) var presentationMode
    //    @State private var numbers = [Int]()
    @State private var numbers = UserDefaults.standard.array(forKey: "listArray") as? [Int] ?? []
    @State private var currentNumber = UserDefaults.standard.integer(forKey: "Add")
    
    var name: String
    
    // MARK: - Body
    var body: some View {
        NavigationView{
            VStack {
                List{
                    ForEach(numbers, id: \.self) {
                        Text("\($0)")
                    } //: Loop
                    .onDelete(perform: removeRows)
                    Button {
                        numbers.append(currentNumber)
                        currentNumber += 1
                        UserDefaults.standard.set(currentNumber, forKey: "Add")
                        UserDefaults.standard.set(numbers, forKey: "listArray")
                    } label: {
                        Text("Add number")
                    } //: Add number button
                    
                } //: List
                
                Text("Hello \(name),\n This is second view")

                HStack{
                    Button {
                        presentationMode.wrappedValue.dismiss()
                        UserDefaults.standard.set(currentNumber, forKey: "Add")
                        UserDefaults.standard.set(numbers, forKey: "listArray")
                    } label: {
                        Text("Dismiss")
                            .font(.title)
                    } //: Button
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    } // Edit button
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            numbers = []
                            currentNumber = 0
                        } label: {
                            Text("Reset")
                        }
                    } // Reset button
                } //: Navigationtoolbar
            } //: Vstack
        } //: Navigationview
    } //: Body
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
        UserDefaults.standard.set(currentNumber, forKey: "Add")
        UserDefaults.standard.set(numbers, forKey: "listArray")
    } // edit remove func
    
} //: ContentView

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView(name: "Naolin")
    }
}
