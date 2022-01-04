//
//  ImageInterpolation.swift
//  UIflow1
//
//  Created by Ryan J. W. Kim on 2021/11/04.
//

import SwiftUI

struct ImageInterpolation: View {
    // MARK: - Properties
    
    
    // MARK: - Body
    var body: some View {
        Image("example")
            .interpolation(.none) // Image Interpolation
            .resizable()
            .scaledToFit()
            .frame(maxHeight: .infinity)
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ImageInterpolation_Previews: PreviewProvider {
    static var previews: some View {
        ImageInterpolation()
    }
}
