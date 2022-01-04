//
//  ConformanceToComparableCustomType.swift
//  MapKitAndBiometricAuth
//
//  Created by Ryan J. W. Kim on 2021/10/30.
//

import SwiftUI

struct User: Identifiable, Comparable {
    // operator overloaded
    // lhs: left hand side, rhs: right hand side
    static func < (lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
    
    let id = UUID()
    let firstName: String
    let lastName: String
}
struct ConformanceToComparableCustomType: View {
    // MARK: - Properties
    
    let users = [
        User(firstName: "Arnold", lastName: "Igh"),
        User(firstName: "Ryan", lastName: "Fgc"),
        User(firstName: "None", lastName: "Abc")
//    ].sorted() // .sorted() just doesn't work
    ].sorted() // after operator overloaded, we can use .sorted()
    
    // MARK: - Body
    var body: some View {
        
        List(users) { user in
            Text("\(user.firstName), \(user.lastName)")
        }
    }
}

struct ConformanceToComparableCustomType_Previews: PreviewProvider {
    static var previews: some View {
        ConformanceToComparableCustomType()
    }
}
