//
//  ContentView.swift
//  Nice Converter
//
//  Created by Ryan J. W. Kim on 2021/09/30.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
            ZStack(alignment: .center) {
                VStack(alignment: .center, spacing: nil) {
//                    NavBarView() //: Navigation bar
//                        .padding(.horizontal, 15)
//                        .padding(.bottom)
//                        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                    //                Spacer()
                    TempConverterView()
                    
//                    Text("Footer")
//                        .padding()
                } //: Vstack
                //            Text("Body")
            } //: Zstack
            .ignoresSafeArea(.all, edges: .top)
        
    } //: Body
}


// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13")
            
    }
}
