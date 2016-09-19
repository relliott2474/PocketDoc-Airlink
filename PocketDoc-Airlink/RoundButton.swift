//
//  RoundButton.swift
//  PocketDoc-Airlink
//
//  Created by Rod Elliott-Mullens on 7/21/16.
//  Copyright © 2016 Rod. All rights reserved.
//

import UIKit

open class RoundButton:UIButton {
    
    var borderColor:UIColor = UIColor.white{
        didSet{
            layer.borderColor = borderColor.cgColor
            }
        }
    var borderWidth:CGFloat = 2.0{
        didSet{
            layer.borderWidth = borderWidth
            }
        }
    override open func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 0.5 * bounds.size.width
        clipsToBounds = true
    }
    

    
}
