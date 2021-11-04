//
//  CustomValueEnvironmentObj.swift
//  UIflow1
//
//  Created by Ryan J. W. Kim on 2021/11/04.
//

import SwiftUI

class User: ObservableObject {
    @Published var name = "Ryan"
}

struct EditView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        TextField("Name", text: $user.name)
    }
}

struct DisplayView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        Text(user.name)
    }
}
struct CustomValueEnvironmentObj: View {
    // MARK: - Properties
    let user = User()
    // MARK: - Body
    var body: some View {
//        VStack {
//            EditView().environmentObject(user)
//
//            DisplayView()
//                .environmentObject(user)
//        }
        // Identical 
        VStack {
            EditView()
            DisplayView()
        }
        .environmentObject(user)
    }
}

struct CustomValueEnvironmentObj_Previews: PreviewProvider {
    static var previews: some View {
        CustomValueEnvironmentObj()
    }
}
