//
//  Todo.swift
//  to-do
//
//  Created by ruihao li on 2020-05-26.
//  Copyright © 2020 Homer li. All rights reserved.
//

import Foundation

struct Todo{
    let title: String
    let isComplete: Bool
    
    init(title: String, isComplete: Bool = false){
        self.title = title
        self.isComplete = isComplete
    }
    
    func completeTask() -> Todo {
        return Todo(title: title, isComplete: !isComplete)
    }
}


