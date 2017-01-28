//
//  ViewController.swift
//  MyQuizWith3
//
//  Created by otukutun on 1/28/17.
//  Copyright © 2017 otukutun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        QuestionDataManager.sharedInstance.loadQuestion()
        
        guard let nextViewController = segue.destination as? QuestionViewController else {
            return
        }
        
        guard let questionData = QuestionDataManager.sharedInstance.nextQuestion() else {
            return
        }
        
        nextViewController.questionData = questionData
    }

}

