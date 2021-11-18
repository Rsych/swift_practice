//
//  BindingAlertAndSheet.swift
//  SplitViewFlexibleLayout
//
//  Created by Ryan J. W. Kim on 2021/11/16.
//

import SwiftUI

//struct User: Identifiable {
//    var id = "Ryan"
//}

struct BindingAlertAndSheet: View {
    // MARK: - Properties
    @State private var isShowingAlert = false
    @State private var selectedUser: User? = nil
    
    // MARK: - Body
    var body: some View {
        Text("Good old binding alert and sheet")
            .onTapGesture {
                selectedUser = User()
                isShowingAlert.toggle()
            } //: ontap
            .alert(isPresented: $isShowingAlert) {
                Alert(title: Text("Binding alert"), message: Text(selectedUser!.id))
            } //: alert
    } //: body
} //: contentview

struct BindingAlertAndSheet_Previews: PreviewProvider {
    static var previews: some View {
        BindingAlertAndSheet()
    }
}
