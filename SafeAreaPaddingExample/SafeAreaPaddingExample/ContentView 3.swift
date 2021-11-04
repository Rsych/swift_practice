//
//  ContentView.swift
//  SafeAreaPaddingExample
//
//  Created by Ryan J.W. Kim on 2021/09/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // MARK: - BODY
        ZStack(alignment: Alignment(horizontal: .center, vertical: .center), content: {
            VStack(alignment: .center, spacing: 0, content: {
                NavigationBarView()
                    .padding(.horizontal, 15)
                    .padding(.bottom)
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                
                Spacer()
                
                Text("Footer")
                
            })
            VStack {
                ForEach(0 ..< 5) { item in
                    Text("content\(item)")
                        .padding()
                } //: Loop
                
            } //: VSTACK
                .padding()
        }) //: ZSTACK
        .ignoresSafeArea(.all, edges: .top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12")
    }
}
