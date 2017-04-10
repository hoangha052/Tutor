//
//  PaddingTextField.swift
//  Bartr
//
//  Created by Thuy Luong on 5/19/16.
//  Copyright © 2016 Thuy Luong. All rights reserved.
//

import UIKit

class PaddingTextField: UITextField {

    let horizontalInset : CGFloat = 10
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: horizontalInset, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: horizontalInset, dy: 0)
    }
}
