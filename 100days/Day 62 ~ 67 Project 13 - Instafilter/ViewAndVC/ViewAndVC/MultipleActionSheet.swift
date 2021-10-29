//
//  MultipleActionSheet.swift
//  ViewAndVC
//
//  Created by Ryan J. W. Kim on 2021/10/28.
//

import SwiftUI

struct MultipleActionSheet: View {
    // MARK: - Properties
    // alert for alert , actionSheet for actionSheet. They are similar in many functions
    @State private var showingActionSheet = false
    @State private var backgroundColor = Color.white
    
    // MARK: - Body
    var body: some View {
        Text("Touch here to change color")
            .frame(width: 300, height: 300)
            .background(backgroundColor)
            .onTapGesture {
                showingActionSheet = true
            } //: OnTap
            .confirmationDialog("Change background", isPresented: $showingActionSheet, titleVisibility: .visible) {
                Button {
                    backgroundColor = .red
                } label: {
                    Text("Red")
                } //: Button Red
                Button("Blue") {
                    backgroundColor = .blue
                }
                Button("Green") {
                    backgroundColor = .green
                }
                Button("Default") {
                    backgroundColor = .white
                }
            } //: ConfirmationDialog
    }
}

struct MultipleActionSheet_Previews: PreviewProvider {
    static var previews: some View {
        MultipleActionSheet()
    }
}
