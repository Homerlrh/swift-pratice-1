//
//  ViewController.swift
//  mathGame
//
//  Created by ruihao li on 2020-05-11.
//  Copyright © 2020 Homer li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var is_num:String = ""
    var choosedNum:String = ""
    
    var p = addition()
    var t = multiplication()

        
    @IBOutlet weak var question: UILabel!
    
    @IBOutlet weak var feedback: UILabel!
    
    @IBOutlet weak var answerInput: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func getAllNum(_ sender: UIButton){
        is_num = sender.titleLabel!.text!
        choosedNum += is_num
        answerInput.text = choosedNum
    }

    @IBAction func deleteLastNum(_ sender: Any) {
        guard choosedNum.count > 0 else{
            return print("it is empty")
        }
        choosedNum.removeLast()
        answerInput.text = choosedNum
    }
    
    
    @IBAction func allClear(_ sender: Any) {
        guard choosedNum.count > 0 else{
            return print("it is empty")
        }
        choosedNum.removeAll()
        answerInput.text = ""
    }
    
    

    @IBAction func startGame(_ sender: UIButton) {
        guard sender.titleLabel!.text! != "? x ?" else {
            t.reset()
            question.text = t.text
            return
        }
        p.reset()
        question.text = p.text

    }
    

    @IBAction func is_correct(_ sender: Any) {
        var is_correct:Bool
        if(question.text!.contains("+") == true){
            is_correct = p.checkNum(answer: Int(choosedNum) ?? 0)
        } else {
            is_correct = t.checkNum(answer: Int(choosedNum) ?? 0)
        }
        var text:String = ""
        if (is_correct == true){
            text = "You are correct 🎇"
        }else{
            text = "You are not correct, try again 😩"
        }
        feedback.text = text
    }
    
    
    

}

