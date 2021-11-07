//
//  GestureDrag.swift
//  GesturesHaptic
//
//  Created by Ryan J. W. Kim on 2021/11/07.
//

import SwiftUI

struct GestureDrag: View {
    // MARK: - Properties
    @State private var offset = CGSize.zero
    @State private var isDragging = false
    
    // MARK: - body
    var body: some View {
        let dragGesture = DragGesture()
            .onChanged { value in offset =
                value.translation }
            .onEnded { _ in
                withAnimation {
                    offset = .zero
                    isDragging = false
                } //: withAnimation
            } //: onEnd
        
        let pressGesture = LongPressGesture()
            .onEnded { value in
                withAnimation {
                isDragging = true
                } //: animation
            } //: onEnded
        
        let combined = pressGesture.sequenced(before: dragGesture)
        
        return Circle()
            .fill(Color.red)
            .frame(width: 64, height: 64)
            .scaleEffect(isDragging ? 1.5 : 1)
            .offset(offset)
            .gesture(combined)
    } //: body
    
} //: contentview

struct
GestureDrag_Previews: PreviewProvider {
    static var previews: some View {
        GestureDrag()
    }
}
