//
//  ContentView.swift
//  iExpense
//
//  Created by Ryan J. W. Kim on 2021/10/09.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    
    @ObservedObject var expense = Expense()
    @State private var showingAddExpense = false
    
    // MARK: - Body
    var body: some View {
        
        NavigationView{
            List{
                ForEach(expense.items, id: \.id) { item in
                    HStack{
                        VStack(alignment: .leading, spacing: 0) {
                            Text(item.name)
                                .foregroundColor(txtColor(for: Int(item.amount)))
                            Text(item.type)
                        }
                        Spacer()
                        Text("$\(item.amount)")
                            .foregroundColor(txtColor(for: Int(item.amount)))
                            
                    }
                } //: Loop
                .onDelete(perform: removeItem)
            } //: List
            .navigationTitle("iEpxpense")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.showingAddExpense = true
                    } label: {
                        Image(systemName: "plus")
                    } //: Button
                    
                } //: ToolbarItem
            } //: Toolbar
            .sheet(isPresented: $showingAddExpense) {
                if #available(iOS 15.0, *) {
                    AddView(expenses: self.expense)
                } else {
                    // Fallback on earlier versions
                }
            } //: sheet
            
        } //: NavigationView
        
    } //: body
    func removeItem(at offsets: IndexSet) {
        expense.items.remove(atOffsets: offsets)
    }
    private func txtColor(for amount: Int) -> Color {
        switch amount{
        case 1...10: return .black
        case 11...100: return .blue
        default : return .red
        }
    }
}
// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13")
    }
}

