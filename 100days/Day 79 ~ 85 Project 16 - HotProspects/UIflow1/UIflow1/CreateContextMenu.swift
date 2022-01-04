//
//  ContextMenu.swift
//  UIflow1
//
//  Created by Ryan J. W. Kim on 2021/11/04.
//

import SwiftUI

struct CreateContextMenu: View {
    // MARK: - Properties
    @State private var backgroundColor = Color.red
    // MARK: - Body
    var body: some View {
        VStack {
            Text("Hello, World!")
                .padding()
                .background(backgroundColor)
            
            Text("Change Color")
                .padding()
                .contextMenu {
                    Button {
                        backgroundColor = .red
                    } label: {
                        Label("Red", systemImage: "checkmark.circle.fill")
                    }

                    Button("Green") {
                        backgroundColor = .green
                    }
                    
                    Button("Blue") {
                        backgroundColor = .blue
                    }
                }
        }
    }
}

struct CreateContextMenu_Previews: PreviewProvider {
    static var previews: some View {
        CreateContextMenu()
    }
}
