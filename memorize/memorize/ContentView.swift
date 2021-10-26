//
//  ContentView.swift
//  memorize
//
//  Created by Ryan J. W. Kim on 2021/10/25.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    var emojis = ["✈️", "🚓", "🚁", "🚲", "🚌", "🚎", "🏎", "🛻", "🛵", "🏍",
                  "🛺", "🚨", "🚔", "🚍", "🚘", "🚖", "🚡", "🚠", "🚟", "🚃",
                  "🚋", "🚞", "🚄", "🚇", "🚊", "🚉", "🛫", "🛬", "🛩", "💺"]
    @State var emojiCount = 20
    // MARK: - Body
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    } //: emoji loop
                } //: LazyVGrid
            } //: ScrollView
            .foregroundColor(.red)
        } //: VStack
        .padding(.horizontal)
    } //: Body
} //: Contentview

struct CardView: View {
    // MARK: - Properties
    var content: String
    @State var isFaceup = true
    
    // MARK: - Body
    var body: some View {
        ZStack(alignment: .center) {
            let shape = RoundedRectangle(cornerRadius: 20)
            
            if isFaceup {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape.padding()
            }
        }//: ZStack
        .onTapGesture {
            isFaceup.toggle()
        }
    }//: CardView Body
}// MARK: - CardView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)

        //        ContentView()
        //            .preferredColorScheme(.light)
    }
}
