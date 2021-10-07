//
//  ContentView.swift
//  Edutainment
//
//  Created by Ryan J. W. Kim on 2021/10/07.
//

import SwiftUI


struct ContentView: View {
    // MARK: - Properties
    @State private var selectedRange: Int = 5
    
    //    var questions = ["5", "10", "20", "All"]
    var questions = [5, 10, 15, 20]
    @State private var selectedQuestions = 5
    @State private var correctAnswer: Int = 0
    @State private var userAnswer = ""
    @State private var answerCorrect = ""
    @State private var numGames = 1
    @State private var score = 0
    @State private var secondNumber = Int.random(in: 1...12)
    @State private var showScore: Bool = false
    
    @FocusState private var answerIsFocused: Bool // iOS 15+
    
    
    // MARK: - Body
    var body: some View {
        NavigationView{
            
            Form {
                // 1. Multiplication stepper
                Section{
                    Stepper("Select range", value: $selectedRange, in: 1...12)
                    
                    Text("Selected range is \(selectedRange)")
                } //: Vstack for range stepper
                .padding()
                // 2. Select how many questions 5, 10, 20, "All"
                Section{
                    Picker("How many questions", selection: $selectedQuestions) {
                        ForEach(questions, id: \.self) {
                            Text("\($0)")
                        } //: Loop
                    } //: Picker
                    .pickerStyle(.segmented)
                    Text("You selected \(selectedQuestions) questions")
                } //: Vstack for questions
                .padding()
                
                // 3. Randomly generate questions as they request, within difficulty range they asked. For "All" should generate all possible combinations.
                
                Section{
                    Text("What is \(selectedRange) ✖️ \(secondNumber)❓")
                    HStack{
                        TextField("Type your answer", text: $userAnswer)
                            .keyboardType(.numberPad)
                            .focused($answerIsFocused)
                        Button {
                            answerIsFocused = false
                            gamePlay(player: Int(userAnswer) ?? 5, numGame: numGames)
                        } label: {
                            Text("Submit")
                        }
                    }
                }
                .padding()
            } //: List
            .listStyle(.plain)
            
            .navigationTitle("Edutainment")
            .navigationBarTitleDisplayMode(.large)
        } //: NavigationView
        .alert(isPresented: $showScore) {
            Alert(title: Text(answerCorrect), message: Text(""), dismissButton: .default(Text("Continue")){
                self.askQuestion()
            })
        }
    } //: View
    func gamePlay(player: Int, numGame: Int) {
        
        let answer = selectedRange * secondNumber
        
        if player == answer {
            score += 1
            answerCorrect = "Correct"
        } else {
            answerCorrect = """
                            Wrong
                            The answer is \(answer)
                            """
        }
        numGames += 1
        showScore = true
        if numGames == selectedQuestions {
            answerCorrect = """
                            Game Over
                            Your final score is
                            \(score)
                            """
        }
        
        print("numGames is \(numGames)")
        print("selectedQuestions is \(selectedRange)")
        print("secondNumber is \(secondNumber)")
        print("answer is \(answer)")
        
    }
    func askQuestion() {
        secondNumber = Int.random(in: 1...12)
    }
    func makeGameArray(_ n: Int) -> [Int] {
        return (0...n).map { _ in
            Int.random(in: 0...11)
        }
    }
}


// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            ContentView()
                .previewDevice("iPhone 13")
        } else {
            // Fallback on earlier versions but now it's okay
            ContentView()
                .previewDevice("iPhone 13")
            
        }
    }
}

