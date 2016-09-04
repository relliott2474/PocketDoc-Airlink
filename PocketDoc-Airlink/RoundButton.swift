//
//  RoundButton.swift
//  PocketDoc-Airlink
//
//  Created by Rod Elliott-Mullens on 7/21/16.
//  Copyright © 2016 Rod. All rights reserved.
//

import UIKit

public class RoundButton:UIButton {
    
    var borderColor:UIColor = UIColor.whiteColor(){
        didSet{
            layer.borderColor = borderColor.CGColor
            }
        }
    var borderWidth:CGFloat = 2.0{
        didSet{
            layer.borderWidth = borderWidth
            }
        }
    override public func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 0.5 * bounds.size.width
        clipsToBounds = true
    }
    

    
}