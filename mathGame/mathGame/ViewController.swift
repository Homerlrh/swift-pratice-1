//
//  ViewController.swift
//  mathGame
//
//  Created by ruihao li on 2020-05-10.
//  Copyright © 2020 ruihao li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var selectedHand: UILabel!
    
    var myhand = ""
    
    let p2_hand = ["👊🏿" , "🤚🏿" , "✌🏿"]
    
    let is_lose = ["👊🏿" : "🤚🏿" , "🤚🏿" : "✌🏿" , "✌🏿" : "👊🏿"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func rock(_ sender: Any) {
        myhand = "👊🏿"
        selectedHand.text = "You have selected \(myhand)"
    }
    
    
    @IBAction func sessior(_ sender: Any) {
        myhand = "✌🏿"
        selectedHand.text = "You have selected \(myhand)"
    }
    
    @IBAction func selectPaper(_ sender: Any) {
        myhand = "🤚🏿"
        selectedHand.text = "You have selected \(myhand)"
    }
    
    func game(){
        let p2 = p2_hand.randomElement()!
        
        var msg = ""
        
        if p2 == myhand {
            msg = "Tie, no winner"
        }else if is_lose[myhand] == p2 {
            msg = "Iphone win"
        }else{
            msg = "You win"
        }
        
        selectedHand.text = "You \(myhand)\n Iphone \(p2)\n \(msg)"
    }
    
    @IBAction func play(_ sender: Any) {
        var count_d = 3
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if count_d > 0 {
                self.selectedHand.text = "\(count_d)"
            }else{
                timer.invalidate()
                self.game()
            }
            count_d -= 1
        }
        
        
    }
    
    
}
