//
//  ValidatingDisablingForm.swift
//  WorkingWithData1
//
//  Created by Ryan J. W. Kim on 2021/10/19.
//

import SwiftUI

struct ValidatingDisablingForm: View {
    // MARK: - Properties
    @State var username = ""
    @State var email = ""
    
    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }
    // MARK: - Body
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("email", text: $email)
            } //: Section1
            Section {
                Button("Creat account") {
                    print("Creating account...")
                }
            } //: Section2
//            .disabled(username.isEmpty || email.isEmpty)
            .disabled(disableForm)
        }
    }
}


// MARK: - Preview
struct ValidatingDisablingForm_Previews: PreviewProvider {
    static var previews: some View {
        ValidatingDisablingForm()
    }
}
