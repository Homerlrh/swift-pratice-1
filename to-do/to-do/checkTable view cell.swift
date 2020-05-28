//
//  checkTable view cell.swift
//  to-do
//
//  Created by ruihao li on 2020-05-27.
//  Copyright © 2020 Homer li. All rights reserved.
//

import UIKit

protocol checkTableViewCellDelegate: AnyObject {
    func checkTableViewCell(_ cell: checkTable_view_cell, didChangeCheckedState checked: Bool)
}

class checkTable_view_cell: UITableViewCell {
    
    @IBOutlet weak var checkbox: Checkbox!
    
    @IBOutlet weak var label: UILabel!
    
    weak var delegate: checkTableViewCellDelegate?
    
    @IBAction func isChecked(_ sender: Any) {
        updateCheckbox()
        
        delegate?.checkTableViewCell(self, didChangeCheckedState: checkbox.checked)
    }
    
    func set(title: String, checked: Bool)  {
        label.text = title
        checkbox.checked = checked
        updateCheckbox()
    }
    
    func set(checked: Bool){
        checkbox.checked = checked
        updateCheckbox()
    }
        
    private func updateCheckbox(){
        let labelString = NSMutableAttributedString(string: label.text!)
        
        if(checkbox.checked){
            labelString.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, labelString.length-1))
        }else{
            labelString.removeAttribute(.strikethroughStyle, range: NSMakeRange(0, labelString.length-1))
        }
        
        label.attributedText = labelString
    }

}



