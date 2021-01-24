//
//  RoundButton.swift
//  calculator1.0
//
//  Created by Shashwat on 24/01/21.
//

import UIKit
@IBDesignable
class RoundButton: UIButton {
    @IBInspectable var cornerRadius:CGFloat=0{
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
}
