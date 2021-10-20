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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

// MARK: - Preview
struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
