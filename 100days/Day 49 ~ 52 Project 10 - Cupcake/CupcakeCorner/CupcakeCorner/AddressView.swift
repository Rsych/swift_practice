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
    
    // MARK: - Body
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name)
                TextField("Stree Address", text: $order.streeAddress)
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
    }
    
}

// MARK: - Preview
struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
