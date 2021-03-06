//
//  ContentView.swift
//  Project 2
//
//  Created by Ryan J. W. Kim on 2021/10/01.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @State private var countries = ["Estonia", "France", "Germany", "italy", "Nigeria",
                     "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    // MARK: - Body
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
        VStack(spacing: 30){
        VStack(alignment: .center, spacing: nil) {
            Text("Tap the flag of")
                .foregroundColor(.white)
            
            Text(countries[correctAnswer])
                .fontWeight(.black)
                .font(.largeTitle)
                .foregroundColor(.white)
        } //: Vstack
          
        ForEach(0 ..< 3) { number in
            Button(action: {
                flagTapped(number)
            }) {
                Image(self.countries[number])
                    .renderingMode(.original)
                    .clipShape(Capsule())
                    .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                    .shadow(color: .blue, radius: 2)
            }
        } //: Loop
            Spacer()
    } //: Vstack
        
        } //: Zstack
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")){
                self.askQuestion()
            })
        }
        
} //: Body
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13")
    }
}
