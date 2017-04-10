//
//  UIImageExtension.swift
//  Bartr
//
//  Created by Thuy Luong on 7/4/16.
//  Copyright © 2016 Thuy Luong. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    func roundedImageWithSize(_ size: CGSize) -> UIImage {
        let rect = CGRect(origin: CGPoint.zero, size: size)
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        UIGraphicsGetCurrentContext()?.addPath(UIBezierPath(roundedRect: rect, cornerRadius: size.width/2).cgPath)
        
        UIGraphicsGetCurrentContext()?.clip()
        self.draw(in: rect)
        let output = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return output!
    }
}
