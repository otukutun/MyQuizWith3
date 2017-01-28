//
//  QuestionDataManager.swift
//  MyQuizWith3
//
//  Created by otukutun on 1/28/17.
//  Copyright © 2017 otukutun. All rights reserved.
//

import Foundation

class QuestionDataManager {
    static let sharedInstance = QuestionDataManager()
    
    var questionDataArray = [QuestionData]()
    
    var nowQuestionIndex: Int = 0
    
    private init() {
        
    }
    
    func loadQuestion() {
        questionDataArray.removeAll()
        
        nowQuestionIndex = 0
        
        guard let csvFilePath = Bundle.main.path(forResource: "question", ofType: "csv") else {
            print("cscファイルは存在しません")
            return
        }
        
        do {
            let csvStringData = try String(contentsOfFile: csvFilePath, encoding: String.Encoding.utf8)
            
            csvStringData.enumerateLines(invoking: {(line, stop) in
                
                let questionSourceArray = line.components(separatedBy: ",")
                
                let questionData = QuestionData(questionSourceDataArray: questionSourceArray)
                
                self.questionDataArray.append(questionData)
                
                questionData.questionNo = self.questionDataArray.count
            })
        } catch let error {
            print("csvファイル読み込みエラーが発生しました:\(error)")
            return
        }
    }
    
    func nextQuestion() -> QuestionData? {
        if nowQuestionIndex < questionDataArray.count {
            let nextQuestion = questionDataArray[nowQuestionIndex]
            nowQuestionIndex += 1
            return nextQuestion
        }
        
        return nil
    }
}
