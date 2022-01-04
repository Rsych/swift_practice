//
//  AddView.swift
//  iExpense
//
//  Created by Ryan J. W. Kim on 2021/10/09.
//

import SwiftUI

@available(iOS 15.0, *)
struct AddView: View {
    // MARK: - Properties
    @ObservedObject var expenses: Expense
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    static let types = ["Business", "Personal"]
    
    @Environment(\.dismiss) var dismiss
    
    @State private var showingAlert = false
    
    // MARK: - Body
    var body: some View {
        NavigationView{
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(Self.types, id: \.self){
                        Text($0)
                    }
                }
                
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
                
            }//: form
            
            .navigationTitle("Add new expense")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        if let actualAmount = Int(self.amount) {
                            let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
                            self.expenses.items.append(item)
                            print(actualAmount)
                            print(expenses.items)
                            dismiss()
                        } else {
                            showingAlert = true //: If not a number show alert
                            amount = ""
                        }
                    } label: {
                        Text("Save")
                    } //: Button
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("Error"), message: Text("Amount must be numbers"), dismissButton: .default(Text("Ok")))
                    } //: Alert
                    
                } //: Toolbar trailing
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Dismiss")
                    } //: Dismiss button
                } //: Toolbar leading
            }
        } //: navigationviw
    } //: Body
} //: View

// MARK: - Preview
@available(iOS 15.0, *)
struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expense())
    }
}
