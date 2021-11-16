//
//  OptionalAlertAndSheet.swift
//  SplitViewFlexibleLayout
//
//  Created by Ryan J. W. Kim on 2021/11/16.
//

import SwiftUI

struct User: Identifiable {
    var id = "Ryan"
}

struct OptionalAlertAndSheet: View {
    // MARK: - Properties
    @State private var selectedUser: User? = nil
    
    // MARK: - Body
    var body: some View {
        Text("Optional alert and sheet!")
            .onTapGesture {
                selectedUser = User()
            } //: ontap
            .alert(item: $selectedUser) { user in
                Alert(title: Text("Optional alert"), message: Text(user.id))
            } //: alert
    } //: body
} //: contentview

struct OptionalAlertAndSheet_Previews: PreviewProvider {
    static var previews: some View {
        OptionalAlertAndSheet()
    }
}
