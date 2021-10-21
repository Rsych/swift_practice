//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Ryan J. W. Kim on 2021/10/20.
//

import SwiftUI

struct AddressView: View {
    // MARK: - Properties
    @ObservedObject var order: Order
    @State private var fieldError = ""
    @State private var showFieldError = false
    @State private var checkOut = false
//    @Environment(\.presentationMode) var presentationMode
    
    // MARK: - Body
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name)
                TextField("Stree Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)
            }//: section
            
            Section {
                NavigationLink(destination: CheckoutView(order: order)) {
                    Text("Check out")
                } //: NavigationLink
            }//: section 2
            .disabled(order.hasValidAddress == false)
            
        }//: Form
        
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showFieldError) {
            Alert(title: Text("Missing field"), message: Text(fieldError), dismissButton: .default(Text("Dismiss")))
        }//: Alert
    } //: Body
    
}

// MARK: - Preview
struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
