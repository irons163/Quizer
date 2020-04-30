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
    var questionsArray = [Question(q: "Is background color yellow?", a: false), Question(q: "Is background color blue?", a: true)]
    var indexOfCurrentQuestion = 0
    var wrongQuestionsNumberArray : Array<Int> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        questionLabel.text = "\(indexOfCurrentQuestion + 1). \(questionsArray[indexOfCurrentQuestion].text)"
    }

    fileprivate func updateUIWith(userAnswer : Bool) {
        if questionsArray[indexOfCurrentQuestion].answer != userAnswer {
            wrongQuestionsNumberArray.append(indexOfCurrentQuestion)
        }
        if indexOfCurrentQuestion == questionsArray.count - 1 {
            if wrongQuestionsNumberArray.count == 0 {
                questionLabel.text = "Your answers are \(correctAnswer)"
                questionLabel.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            } else {
                questionLabel.text = "Your answers have some \(wrongAnswer)"
                questionLabel.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
            }
        } else {
            indexOfCurrentQuestion += 1
            questionLabel.text = "\(indexOfCurrentQuestion + 1). \(questionsArray[indexOfCurrentQuestion].text)"
        }
    }
    
    @IBAction func trueButtonClick(_ sender: Any) {
        updateUIWith(userAnswer: true)
    }
    
    @IBAction func falseButtonClick(_ sender: Any) {
        updateUIWith(userAnswer: false)
    }
}

