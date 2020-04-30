//
//  Question.swift
//  Quizer
//
//  Created by irons on 2020/4/30.
//  Copyright © 2020 irons. All rights reserved.
//

import Foundation

struct Question {
    let text : String
    let answer : Bool
    
    init(q: String, a: Bool) {
        text = q
        answer = a
    }
}
