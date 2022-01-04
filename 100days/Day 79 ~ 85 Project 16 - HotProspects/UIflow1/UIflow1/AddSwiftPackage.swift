//
//  AddSwiftPackage.swift
//  UIflow1
//
//  Created by Ryan J. W. Kim on 2021/11/05.
//

import SwiftUI
import SamplePackage

struct AddSwiftPackage: View {
    // MARK: - Properties
    let possibleNumbers = Array(1...60)
    
    var results: String {
        let selected = possibleNumbers.random(7).sorted()
        let strings = selected.map(String.init)
        return strings.joined(separator: ", ")
    }
    // MARK: - Body
    var body: some View {
        Text(results)
    }
}

struct AddSwiftPackage_Previews: PreviewProvider {
    static var previews: some View {
        AddSwiftPackage()
    }
}
