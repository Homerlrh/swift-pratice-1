//
//  TodoViewController.swift
//  to-do
//
//  Created by ruihao li on 2020-05-27.
//  Copyright © 2020 Homer li. All rights reserved.
//

import UIKit

protocol todoViewControlDelegate: AnyObject {
    func todoViewController(_ vc: TodoViewController, didSaveTodo: Todo)
}

class TodoViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    var todo : Todo?

    weak var delegate: todoViewControlDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.text = todo?.title
    }
    

    @IBAction func save(_ sender: Any) {
        let todo = Todo(title: textField.text!)
        delegate?.todoViewController(self, didSaveTodo: todo)
    }
    
}
