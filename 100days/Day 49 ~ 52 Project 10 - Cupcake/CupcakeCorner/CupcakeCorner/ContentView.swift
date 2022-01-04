//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Ryan J. W. Kim on 2021/10/19.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Preview
    @ObservedObject var order = Order()
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.type) {
                        ForEach(0..<Order.types.count) {
                            Text(Order.types[$0])
                        } //: Loop
                    } //: Picker
                    Stepper(value: $order.quantity, in:3...20) {
                        Text("Number of cakes: \(order.quantity)")
                    } //: stepper
                }//: section
                Section {
                    Toggle(isOn: $order.specialRequestEnabled.animation()) {
                        Text("Any special requests?")
                    }
                    if order.specialRequestEnabled {
                        Toggle(isOn: $order.extraFrosting) {
                            Text("Add extra frosting")
                        }
                        Toggle(isOn: $order.addSprinkles) {
                            Text("Add Sprinkiles")
                        }
                    }
                }//: Special request section
                Section {
                    NavigationLink(destination: AddressView(order: order)) {
                        Text("Delivery details")
                    }
                } //: Delivery Section
            }//: Form
            .navigationTitle("Cupcake corner")
        }//: NavigationView
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13")
    }
}
