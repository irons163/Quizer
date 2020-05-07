//
//  QuestionManager.swift
//  Quizer
//
//  Created by irons on 2020/5/7.
//  Copyright © 2020 irons. All rights reserved.
//

import Foundation

struct QuestionManager {
    var questionsArray = [Question(q: "Is background color yellow?", a: false), Question(q: "Is background color blue?", a: true)]
    
    var indexOfCurrentQuestion = 0
    
    func checkAnswer(_ userAnswer: Bool) -> Bool {
        if questionsArray[indexOfCurrentQuestion].answer != userAnswer {
            return false
        } else {
            return true
        }
    }
    
    func getQuestionText() -> String {
        return questionsArray[indexOfCurrentQuestion].text
    }
    
    func getProgress() -> Float {
        let progress = Float(indexOfCurrentQuestion + 1) / Float(questionsArray.count)
        return progress
    }
    
    mutating func nextQuestion() {
        indexOfCurrentQuestion += 1
    }
}
