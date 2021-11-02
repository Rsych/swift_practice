//
//  SizeClassAnyView.swift
//  BindingAnyViewCoreData
//
//  Created by Ryan J. W. Kim on 2021/10/23.
//

import SwiftUI

struct SizeClassAnyView: View {
    // MARK: - Properties
//    @Environment(\.presentationMode) var presentationMode
    @Environment(\.horizontalSizeClass) var sizeClass
    
    // MARK: - Body
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .onTapGesture {
//                self.presentationMode.wrappedValue.dismiss()
//            } // allow swiftui to make sure the correct state is updated when the view is dismissed
        if sizeClass == .compact {
            return AnyView(VStack {
                Text("Active size class:")
                Text("Compact")
            }
            .font(.largeTitle)) //: AnyView
        } else {
            return AnyView(HStack {
                Text("Active size class:")
                Text("Regular")
            }
            .font(.largeTitle))//: AnyView2
        }
    }
}

struct SizeClassAnyView_Previews: PreviewProvider {
    static var previews: some View {
        SizeClassAnyView()

    }
}
