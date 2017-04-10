//
//  PaddingLabel.swift
//  Bartr
//
//  Created by Thuy Luong on 5/19/16.
//  Copyright © 2016 Thuy Luong. All rights reserved.
//

import UIKit

class PaddingLabel: UILabel {

    override func draw(_ rect: CGRect) {
        let textInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        self.drawText(in: UIEdgeInsetsInsetRect(rect, textInset))
    }

}
