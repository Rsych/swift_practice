//
//  ContentView.swift
//  iExpense
//
//  Created by Ryan J. W. Kim on 2021/10/09.
//

import SwiftUI

struct ExpenseItem: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}

class Expense: ObservableObject {
    @Published var items = [ExpenseItem]()
}

struct ContentView: View {
    // MARK: - Properties
    
    @ObservedObject var expense = Expense()
    
    // MARK: - Body
    var body: some View {
        
        NavigationView{
            List{
                ForEach(expense.items, id: \.id) { item in
                    Text(item.name)
                } //: Loop
                .onDelete(perform: removeItem)
            } //: List
            .navigationTitle("iEpxpense")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5)
                        self.expense.items.append(expense)
                    } label: {
                        Image(systemName: "plus")
                    } //: Button
                    
                } //: ToolbarItem
            } //: Toolbar
        } //: NavigationView
    } //: body
    func removeItem(at offsets: IndexSet) {
        expense.items.remove(atOffsets: offsets)
    }
}
// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13")
    }
}

