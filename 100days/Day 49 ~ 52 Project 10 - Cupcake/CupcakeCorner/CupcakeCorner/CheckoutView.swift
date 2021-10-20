//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Ryan J. W. Kim on 2021/10/20.
//

import SwiftUI

struct CheckoutView: View {
    // MARK: - Properties
    @ObservedObject var order: Order
    
    // MARK: - Body
    var body: some View {
        Text("hello")
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
