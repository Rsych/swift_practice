//
//  QuestionManager.swift
//  Edutainment
//
//  Created by Ryan J. W. Kim on 2021/10/07.
//

import Foundation
struct Questionmanager {
    // MARK: - Properties
    
    var maximumQuestions = "5"
    
    var maxQuestionInt: Int {
        switch maximumQuestions {
        case "5": return 5
        case "10": return 10
        case "20": return 20
        case "All": return 10
        default: return 5
        }
    }
}
