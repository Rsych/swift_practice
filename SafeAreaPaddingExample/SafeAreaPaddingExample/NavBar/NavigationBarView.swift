//
//  NavigationBarView.swift
//  SafeAreaPaddingExample
//
//  Created by Ryan J.W. Kim on 2021/09/18.
//

import SwiftUI

struct NavigationBarView: View {
    // MARK: - Properties
    @State private var isAnimated:Bool = false
    
    var body: some View {
        HStack(alignment: .center, spacing: nil, content: {
            Button(action: {}, label: {
                Image(systemName: "add")
                    .font(.title)
                    .foregroundColor(.blue)
            }) //: Button
            
            Spacer()
            
            Text("Home")
                .opacity(isAnimated ? 1 : 0)
                .offset(x: 0, y: isAnimated ? 0 : -25)
                .onAppear(perform: {
                    withAnimation(.easeOut(duration: 0.5)){
                        isAnimated.toggle()
                    }
                })
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "trash.circle")
                    .font(.title)
                    .foregroundColor(.black)
            })
        }) //: Hstack
    }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView()
            .previewLayout(.sizeThatFits)
    }
}
