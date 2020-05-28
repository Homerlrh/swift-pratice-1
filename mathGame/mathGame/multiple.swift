//
//  multiple.swift
//  mathGame
//
//  Created by ruihao li on 2020-05-11.
//  Copyright © 2020 Homer li. All rights reserved.
//

import Foundation

struct multiplication {
    private let num1: Int
    private let num2: Int
    let answer: Int
    
    init() {
        num1 = Int.random(in: 1...100)
        num2 = Int.random(in: 1...100)
        answer = num1 * num2
    }
    
    mutating func reset(){
        self = multiplication()
    }
}

extension multiplication:MathQuestion{
    
    func checkNum(answer: Int) -> Bool {
        return self.answer == answer
    }
    
    var text: String {
        get{
            "What is \(num1) x \(num2)"
        }
    }
}
