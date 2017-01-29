//
//  QuestionData.swift
//  MyQuizWith3
//
//  Created by otukutun on 1/28/17.
//  Copyright © 2017 otukutun. All rights reserved.
//

import Foundation

class QuestionData {
    var question: String
    var answer1: String
    var answer2: String
    var answer3: String
    var answer4: String
    
    var correctAnswerNumber: Int
    
    var userChoiceAnswerNnumber: Int?
    
    var questionNo: Int = 0
    
    init(questionSourceDataArray: [String]) {
        question = questionSourceDataArray[0]
        answer1 = questionSourceDataArray[1]
        answer2 = questionSourceDataArray[2]
        answer3 = questionSourceDataArray[3]
        answer4 = questionSourceDataArray[4]
        correctAnswerNumber = Int(questionSourceDataArray[5])!
    }
    
    func isCorrect() -> Bool {
        if correctAnswerNumber == userChoiceAnswerNnumber {
            return true
        }
        return false
    }
}
