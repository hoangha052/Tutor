//
//  UITextViewExtension.swift
//  Tinry
//
//  Created by hoangha052 on 11/15/16.
//  Copyright © 2016 Thuy Luong. All rights reserved.
//

import UIKit
extension UITextView {
    
    func getHeightOfContentWithDefaultHeight(_ value: Int) -> CGFloat
    {
        let fixedWidth = self.bounds.size.width - 10
        // Tính kích thước của text dựa trên font hiện tại của text view
        let msgContent = self.text
        let newSize = NSString(string: msgContent!).boundingRect(
            with        : CGSize(width: fixedWidth, height: CGFloat(MAXFLOAT)),
            options     : [.usesLineFragmentOrigin, .usesFontLeading],
            attributes  : [NSFontAttributeName : self.font!],
            context     : nil)
 
        return max(newSize.size.height + 4, CGFloat(value))
    }
    
}
