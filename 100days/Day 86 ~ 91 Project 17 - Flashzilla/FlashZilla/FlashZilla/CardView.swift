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
    
    @State private var isShowingAnswer = false
    
    // MARK: - Body
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(.white)
                .shadow(radius: 10)
            
            VStack {
                Text(card.prompt)
                    .font(.largeTitle)
                    .foregroundColor(.primary)
                if isShowingAnswer {
                    Text(card.answer)
                        .font(.title)
                        .foregroundColor(.secondary)
                } //: showinganswer only true
            } //: VStack
            .padding(20)
            .multilineTextAlignment(.center)
        } //: ZStack
        .frame(width: 450, height: 250)
        .onTapGesture {
            isShowingAnswer.toggle()
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card.example)
    }
}
