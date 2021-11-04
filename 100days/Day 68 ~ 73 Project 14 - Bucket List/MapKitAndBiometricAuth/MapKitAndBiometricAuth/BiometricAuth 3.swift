//
//  BiometricAuth.swift
//  MapKitAndBiometricAuth
//
//  Created by Ryan J. W. Kim on 2021/10/31.
//

import SwiftUI
import LocalAuthentication

struct BiometricAuth: View {
    // MARK: - Properties
    @State private var isUnlocked = false
    
    // MARK: - Body
    var body: some View {
        VStack {
            if isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        } //: Vstack
        .onAppear {
            authenticate()
        }
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authError in
                DispatchQueue.main.async {
                    if success {
                        // authenticated successfully
                        isUnlocked = true
                        
                    } else {
                        // There was a problem
                    }
                }
            }
        } else {
            // no biometrics
        }
    } //: BiometricAuth func
}

struct BiometricAuth_Previews: PreviewProvider {
    static var previews: some View {
        BiometricAuth()
    }
}
