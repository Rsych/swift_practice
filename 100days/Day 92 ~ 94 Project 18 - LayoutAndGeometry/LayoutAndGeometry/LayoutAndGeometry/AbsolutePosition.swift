//
//  AbsolutePosition.swift
//  LayoutAndGeometry
//
//  Created by Ryan J. W. Kim on 2021/11/14.
//

import SwiftUI

struct AbsolutePosition: View {
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        Text("Hello, World!")
            .background(Color.red)
            .position(x: 100, y: 100)
            .offset(x: 150, y: 150)
            .background(Color.blue)
            .ignoresSafeArea()
        
        
    }
}

struct AbsolutePosition_Previews: PreviewProvider {
    static var previews: some View {
        AbsolutePosition()
    }
}
