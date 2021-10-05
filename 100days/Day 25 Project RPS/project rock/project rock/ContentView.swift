//
//  ContentView.swift
//  project rock
//
//  Created by Ryan J. W. Kim on 2021/10/03.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    let hands = ["Rock", "Paper", "Scissor"]
    
    @State private var appChoice = 0
    @State private var shouldWin = false
    @State private var score = 0
    @State private var playerSelect = 0
    @State private var numGames = 0
    
    @State private var showingScore = false
    @State private var answerCorrect = ""
    
    func outCome(player: Int) {
        if shouldWin {
            switch (player){
            case 0:
                appChoice = 2
            case 1:
                appChoice = 0
            default:
                appChoice = 1
            } // first switch player win
            score += 1
            answerCorrect = "You Win"
            
            
        } else {
            switch (player){
            case 0:
                appChoice = 2
            case 1:
                appChoice = 1
            default:
                appChoice = 0
            } // second switch player lose
            score -= 1
            answerCorrect = "You Lost"
            
        }
        playerSelect = player
        shouldWin = Bool.random()
        numGames += 1
        showingScore = true
        if numGames == 10 {
            score = 0
            numGames = 0
        }
        }
    
    
    
    //    func outCome(player: String, app: String) -> String{
    //        switch (player, app) {
    //        case ("Rock", "Rock"): return "You tied"
    //        case ("Rock", "Paper"): return "You lost"
    //        case ("Rock", "Scissor"): return "You won"
    //
    //        case ("Paper", "Rock"): return "You won"
    //        case ("Paper", "Paper"): return "You ties"
    //        case ("Paper", "Scissor"): return "You lost"
    //
    //        case ("Scissor", "Rock"): return "You lost"
    //        case ("Scissor", "Paper"): return "You win"
    //        case ("Scissor", "Scissor"): return "You tied"
    //
    //        default: return "Error"
    //        } //: Switch
    //    } //: func
    
    // MARK: - Body
    var body: some View {
        VStack{
            HStack{
                Button {
                    outCome(player: 0)
                    //: buttton toggle logic
                } label: {
                    Text(hands[0])
                } //: Button1
                .padding()
                
                Button {
                    outCome(player: 1)
                    //: buttton toggle logic
                } label: {
                    Text(hands[1])
                } //: Button2
                .padding()
                
                Button {
                    outCome(player: 2)
                    //: buttton toggle logic
                } label: {
                    Text(hands[2])
                }
                .padding()
                
            } //: Hstack
            Text("""
                 You chose \(hands[playerSelect])
                 App chose \(hands[appChoice])
                 You've played \(numGames)
                 """)
//            Text(shouldWin ? "Win": "lost")
            Text("Score is \(score)")
        } //: Vstack
        .alert(isPresented: $showingScore) {
            Alert(title: Text(answerCorrect), message: Text("Your score is \(score)"))
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13")
    }
}
}
