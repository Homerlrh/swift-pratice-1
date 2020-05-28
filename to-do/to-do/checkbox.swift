//
//  checkbox.swift
//  custome_view
//
//  Created by ruihao li on 2020-05-26.
//  Copyright © 2020 Homer li. All rights reserved.
//
import Foundation
import UIKit

@IBDesignable
class Checkbox: UIControl{

    private weak var imageView: UIImageView!
    
    private var image: UIImage{
        return checked ? UIImage(systemName: "checkmark.square.fill")! : UIImage(systemName: "square")!
    }
    
    @IBInspectable
    public var checked: Bool = false{
        didSet{
            imageView.image = image
        }
    }
    
    override init (frame: CGRect){
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup(){
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imgView)
        
        imgView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imgView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imgView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imgView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        imgView.image = image
        imgView.contentMode = .scaleAspectFit
        
        self.imageView = imgView
        
        backgroundColor = UIColor.clear
        
        addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
    }
    
    @objc func touchUpInside(){
        checked = !checked
        sendActions(for: .valueChanged)
    }
}
