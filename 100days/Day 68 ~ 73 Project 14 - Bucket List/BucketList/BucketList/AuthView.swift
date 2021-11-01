//
//  AuthView.swift
//  BucketList
//
//  Created by Ryan J. W. Kim on 2021/11/01.
//

import SwiftUI
import LocalAuthentication

struct AuthView: View {
    @Binding var isUnlocked: Bool
    
    @State private var showingAuthenticationError = false
    @State private var authenticationErrorTitle = ""
    @State private var authenticationErrorMessage = ""
    
    var body: some View {
        Button {
            self.authenticate()
        } label: {
            Text("Unlock")
        } //: Button
        .padding()
        .background(Color.blue)
        .foregroundColor(.white)
        .clipShape(Capsule())
        .alert(isPresented: $showingAuthenticationError) {
            Alert(title: Text(authenticationErrorTitle), message: Text(authenticationErrorMessage), dismissButton: .default(Text("OK")))
        } //: Alert
    } //: Body
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            let reason = "We need to make sure it's you."
            
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) {
                success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        isUnlocked = true
                    } else {
                        authenticationErrorTitle = "Authentication Failed"
                        authenticationErrorMessage = authenticationError!.localizedDescription
                        showingAuthenticationError = true
                    }
                }
            }
        } else {
            authenticationErrorTitle = "Authentication Failed"
            authenticationErrorMessage = "Your device does not support biometric authentication. \nYou have to use passcode."
            showingAuthenticationError = true
        }
    } //: Auth function
} //: contentView

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView(isUnlocked: .constant(false))
    }
}
