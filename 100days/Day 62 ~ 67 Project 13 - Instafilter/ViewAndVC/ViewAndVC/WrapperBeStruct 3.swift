//
//  WrapperBeStruct.swift
//  ViewAndVC
//
//  Created by Ryan J. W. Kim on 2021/10/28.
//

import SwiftUI

struct WrapperBeStruct: View {
    // MARK: - Properties
    @State private var blurAmount: CGFloat = 0 {
        didSet {
            print("New value is\(blurAmount)") // is not printed cuz it's wrapped
        }
    }
    
    
    // MARK: - Body
    var body: some View {
        // MARK: - Custom binding
        let blur = Binding<CGFloat>(
            get: {
                self.blurAmount
            }, set: {
                self.blurAmount = $0
                print("New value is \(self.blurAmount)")
            })
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .blur(radius: blurAmount)
            
            Slider(value: blur, in: 0...20)
        }
    }
}

struct WrapperBeStruct_Previews: PreviewProvider {
    static var previews: some View {
        WrapperBeStruct()
    }
}
