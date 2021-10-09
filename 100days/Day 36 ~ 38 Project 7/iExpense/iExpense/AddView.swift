//
//  AddView.swift
//  iExpense
//
//  Created by Ryan J. W. Kim on 2021/10/09.
//

import SwiftUI

struct AddView: View {
    // MARK: - Properties
    @State private var name = ""
    @State private var type = "Personal"
    
    // MARK: - Body
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    } //: Body
} //: View

// MARK: - Preview
struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
