//
//  QuestionModel.swift
//  Edutainment
//
//  Created by Ryan J. W. Kim on 2021/10/07.
//

import Foundation

struct Questions: Hashable {
    let firstNumber: Int
    let secondNumber: Int
    
    var correctAnswer: Int{
        return firstNumber * secondNumber
    }
    var userCorrect: Bool = false
    
    var question: String {
        return "\(firstNumber) ✖️ \(secondNumber)❔"
    }
}
