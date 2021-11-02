//
//  FirstView.swift
//  BucketList
//
//  Created by Ryan J. W. Kim on 2021/11/01.
//

import SwiftUI

struct FirstView: View {
    // MARK: - Properties
    @State private var isUnlocked = false
    
    // MARK: - Body
    var body: some View {
        Group {
            if isUnlocked {
                ContentView()
            } else {
                AuthView(isUnlocked: $isUnlocked)
            }
        } //: Group
    } //: body
}
// MARK: - Preview
struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
