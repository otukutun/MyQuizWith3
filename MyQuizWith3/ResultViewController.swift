//
//  ResultViewController.swift
//  MyQuizWith3
//
//  Created by otukutun on 1/28/17.
//  Copyright © 2017 otukutun. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let questionCount = QuestionDataManager.sharedInstance.questionDataArray.count
        
        var correctCount: Int = 0
        
        for QuestionData in QuestionDataManager.sharedInstance.questionDataArray {
            if QuestionData.isCorrect() {
                correctCount += 1
            }
        }

        let correctPercent: Float = (Float(correctCount) / Float(questionCount)) * 100
        
        correctPercentLabel.text = String(format: "%.1f", correctPercent) + "%"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var correctPercentLabel: UILabel!

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
