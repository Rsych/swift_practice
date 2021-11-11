//
//  CardView.swift
//  FlashZilla
//
//  Created by Ryan J. W. Kim on 2021/11/09.
//

import SwiftUI

struct CardView: View {
    // MARK: - Properties
    let card: Card
    var removal: (() -> Void)? = nil
    
    @State private var isShowingAnswer = false
    @State private var offset = CGSize.zero
    @State private var feedback = UINotificationFeedbackGenerator()
    
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutcolor
    @Environment(\.accessibilityEnabled) var accessibilityEnabled
    // MARK: - Body
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(
                    differentiateWithoutcolor
                    ? Color.white
                    : Color.white
                        .opacity(1 - Double(abs(offset.width / 50))))
                .background(
                    differentiateWithoutcolor
                    ? nil
                    : RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(offset.width > 0 ? Color.green : .red)
                ) //: Rectangle fill color optional by swipe left right
                .shadow(radius: 10)
            
            VStack {
                if accessibilityEnabled {
                    Text(isShowingAnswer ? card.answer : card.prompt)
                        .font(.largeTitle)
                        .foregroundColor(.black)
                } else {
                    Text(card.prompt)
                        .font(.largeTitle)
                        .foregroundColor(.primary)
                    if isShowingAnswer {
                        Text(card.answer)
                            .font(.title)
                            .foregroundColor(.secondary)
                    }
                } //: showinganswer only true
            } //: VStack
            .padding(20)
            .multilineTextAlignment(.center)
        } //: ZStack
        .frame(width: 450, height: 250)
        
        .rotationEffect(.degrees(Double(offset.width / 5)))
        .offset(x: offset.width * 5, y: 0)
        .opacity(2 - Double(abs(offset.width / 50)))
        .accessibilityAddTraits(.isButton)
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                    feedback.prepare() //: haptic prepare
                }
                .onEnded{ _ in
                    if abs(offset.width) > 100 {
                        if offset.width > 0 {
                            feedback.notificationOccurred(.success)
                        } else {
                            feedback.notificationOccurred(.error)
                        } //: haptic on or error
                        // remove the card
                        removal?()
                    } else {
                        offset = .zero
                    }
                }
        ) //: Moving views with draggesture
        
        .onTapGesture {
            isShowingAnswer.toggle()
        }
        .animation(.spring())
    } //: body
} //: contentview

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card.example)
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
