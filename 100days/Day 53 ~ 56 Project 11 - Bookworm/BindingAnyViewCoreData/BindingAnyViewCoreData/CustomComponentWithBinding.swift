//
//  CustomComponentWithBinding.swift
//  BindingAnyViewCoreData
//
//  Created by Ryan J. W. Kim on 2021/10/22.
//

import SwiftUI

struct PushButton: View {
    let title: String
    @Binding var isOn: Bool
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }//: Button
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: isOn ? onColors : offColors), startPoint: .top, endPoint: .bottom))
        .foregroundColor(.white)
        .clipShape(Capsule())
        .shadow(radius: isOn ? 0 : 5)
    }
}

struct CustomComponentWithBinding: View {
    // MARK: - Properties
    @State private var rememberMe = false
    
    // MARK: - Body
    var body: some View {
        VStack {
            PushButton(title: "Remember Me", isOn: $rememberMe)
            Text(rememberMe ? "On" : "Off")
        }//: Vstack
    }
}

struct CustomComponentWithBinding_Previews: PreviewProvider {
    static var previews: some View {
        CustomComponentWithBinding()
    }
}
