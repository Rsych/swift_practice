//
//  ContentView.swift
//  FlashZilla
//
//  Created by Ryan J. W. Kim on 2021/11/09.
//

import SwiftUI

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = CGFloat(total - position)
        return self.offset(CGSize(width: 0, height: offset * 10))
    }
}

struct ContentView: View {
    // MARK: - Properties
    @State private var cards = [Card](repeating: Card.example, count: 10)
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutcolor
    @State private var timeRemain = 100
    @State private var isActive = true
    let timer = Timer.publish(every: 1, tolerance: 0, on: .main, in: .common).autoconnect()
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Time: \(timeRemain)")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .background(
                        Capsule()
                            .fill(.black)
                            .opacity(0.75)
                    )
                ZStack {
                    ForEach(0..<cards.count, id: \.self) { index in
                        CardView(card: cards[index]) {
                            withAnimation {
                                removeCard(at: index)
                            }
                        }
                        .stacked(at: index, in: cards.count)
                    } //: loop
                } //: ZStack
                // only allowed when timeRemain is > 0
                .allowsHitTesting(timeRemain > 0)
                
                if cards.isEmpty {
                    Button {
                        resetCards()
                    } label: {
                        Text("Start Again")
                    }
                    .padding()
                    .background(.white)
                    .foregroundColor(.black)
                    .clipShape(Capsule())
                } //: card empty = appear reset Button
            } //: Vstack
            if differentiateWithoutcolor {
                VStack {
                    Spacer()
                    
                    HStack {
                        Image(systemName: "xmark.circle")
                            .padding()
                            .background(.black.opacity(0.7))
                            .clipShape(Circle())
                        Spacer()
                        Image(systemName: "checkmark.circle")
                            .padding()
                            .background(.black.opacity(0.7))
                            .clipShape(Circle())
                    }
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding()
                } //: accessibility Vstack
            } //: accessibility
        } //: Zstack
        .onReceive(timer) { time in
            guard isActive else { return }
            if timeRemain > 0 {
                timeRemain -= 1
            }
        } //: timer receive
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
            isActive = false
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
            if self.cards.isEmpty == false {
                isActive = true
            }
        }
    } //: body
    
    func removeCard(at index: Int) {
        cards.remove(at: index)
        
        if cards.isEmpty {
            isActive = false
        }
    } //: Removecard func
    
    func resetCards() {
        cards = [Card](repeating: Card.example, count: 10)
        timeRemain = 100
        isActive = true
    } //: resetcard func
    
} //: contentview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
