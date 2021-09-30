//
//  NavBarView.swift
//  Nice Converter
//
//  Created by Ryan J. W. Kim on 2021/09/30.
//

import SwiftUI



struct NavBarView: View {
    // MARK: - Properties
    @State private var isAnimated: Bool = false
    
    // MARK: - Body
    
    var body: some View {
        HStack(alignment: .center, spacing: nil) {
            Button(action: {}) {
                Image(systemName: "magnifyingglass.circle")
                    .font(.title)
                    .foregroundColor(.gray)
            } //: Button
            Spacer()
            Text("Converter")
                .foregroundColor(.gray)
                .opacity(isAnimated ? 1 : 0)
                .offset(x: 0, y: isAnimated ? 0 : -25)
                .onAppear {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        isAnimated.toggle()
                    }
                }
            Spacer()
            Button(action: {}) {
                Image(systemName: "arrow.uturn.forward.circle")
                    .font(.title)
                    .foregroundColor(.gray)
            }
        } //: Hstack
    }
}

// MARK: - Preview
struct NavBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavBarView()
            .previewDevice("iPhone 13")
            .previewLayout(.sizeThatFits)
    }
}
