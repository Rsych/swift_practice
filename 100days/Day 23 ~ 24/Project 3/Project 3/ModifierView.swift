//
//  ModifierView.swift
//  Project 3
//
//  Created by Ryan J. W. Kim on 2021/10/03.
//

import SwiftUI
// MARK: - View Modifier
struct Title: ViewModifier {
    let sysName = ["clock", "circle.grid.cross", "circle.grid.cross.fill", "circle.square.fill"]
    
    func body(content: Content) -> some View {
        HStack{
            VStack{
                ForEach(0..<sysName.count) { item in
                    Image(systemName: sysName[item])
                    content
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                } //: Loop
            } //: Vstack
        } //: Hstack
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}
struct ModifierView: View {
    // MARK: - Properties
    @State private var colorToggle = false
    
    // MARK: - Body
    var body: some View {
        Button {
            self.colorToggle.toggle()
        } label: {
            Text("Hello, World")
        }
        .foregroundColor(colorToggle ? .red : .black)
        .titleStyle()
    }
}

// MARK: - Preview
struct ModifierView_Previews: PreviewProvider {
    static var previews: some View {
        ModifierView()
    }
}
