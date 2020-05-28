//
//  mathGame.swift
//  mathGame
//
//  Created by ruihao li on 2020-05-11.
//  Copyright © 2020 Homer li. All rights reserved.
//

import Foundation

protocol MathQuestion {
    var text: String {get}
    var answer: Int {get}
}

extension MathQuestion{
    func checkNum(answer:Int) -> Bool{
        return answer == self.answer
    }
}
