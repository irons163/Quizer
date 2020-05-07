//
//  ViewController.swift
//  Quizer
//
//  Created by irons on 2020/4/30.
//  Copyright © 2020 irons. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    @IBOutlet weak var questionLabel: UILabel!
    
    let correctAnswer = "Correct!"
    let wrongAnswer = "Wrong!"
    var questionManager = QuestionManager()
    
    var wrongQuestionsNumberArray : Array<Int> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        questionLabel.text = "\(questionManager.indexOfCurrentQuestion + 1). \(questionManager.getQuestionText())"
    }

    fileprivate func updateUIWith(userAnswer : Bool) {
        if !questionManager.checkAnswer(userAnswer) {
            wrongQuestionsNumberArray.append(questionManager.indexOfCurrentQuestion)
        }
        
        if questionManager.getProgress() == 1 {
            if wrongQuestionsNumberArray.count == 0 {
                questionLabel.text = "Your answers are \(correctAnswer)"
                questionLabel.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            } else {
                questionLabel.text = "Your answers have some \(wrongAnswer)"
                questionLabel.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
            }
        } else {
            questionManager.nextQuestion()
            questionLabel.text = "\(questionManager.indexOfCurrentQuestion + 1). \(questionManager.getQuestionText())"
        }
    }
    
    @IBAction func trueButtonClick(_ sender: Any) {
        updateUIWith(userAnswer: true)
    }
    
    @IBAction func falseButtonClick(_ sender: Any) {
        updateUIWith(userAnswer: false)
    }
}

