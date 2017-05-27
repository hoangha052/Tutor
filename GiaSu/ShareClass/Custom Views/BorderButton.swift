//
//  BorderButton.swift
//  WeTrade
//
//  Created by admin on 2/27/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit
@IBDesignable
class BorderButton: UIButton {

    @IBInspectable var cornerRadisus:CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadisus
            layer.masksToBounds = cornerRadisus > 0
        }
    }
    
    @IBInspectable var imageRightInsets: CGFloat = 0  {
        didSet {
            self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, imageRightInsets)
        }
    }
    
    @IBInspectable var imageLeftInsets: CGFloat = 0  {
        didSet {
            self.imageEdgeInsets = UIEdgeInsetsMake(0, imageLeftInsets, 0, 0)
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    func rightInsetsImage () {
        self.imageEdgeInsets = UIEdgeInsetsMake(5, 0, 5, self.frame.size.width / 2 )
        self.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0)
    }
}
