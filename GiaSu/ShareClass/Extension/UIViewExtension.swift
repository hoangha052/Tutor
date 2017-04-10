//
//  UIViewExtension.swift
//  Bartr
//
//  Created by Thuy Luong on 6/9/16.
//  Copyright © 2016 Thuy Luong. All rights reserved.
//

import UIKit

extension UIView {    
    func updateY(_ y: CGFloat) {
        let frame = self.frame
        let newFrame = CGRect(x: frame.minX, y: y, width: frame.size.width, height: frame.size.height)
        self.frame = newFrame
    }
    
    class func createCircularMaskForView(_ view: UIView, maskFrame: CGRect) {
        let mask = CALayer()
        let maskImage = UIImage(named: "mask")!
        mask.contents = maskImage.cgImage
        mask.frame = maskFrame
        view.layer.mask = mask
        view.layer.masksToBounds = true
    }
    
    class func createRoundedMaskForView(_ view: UIView, roundedRect: CGRect, roundingCorners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: roundedRect, byRoundingCorners: roundingCorners, cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        // maskLayer uses frame of path
        maskLayer.path = maskPath.cgPath
        maskLayer.fillColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).cgColor
        view.layer.addSublayer(maskLayer)
        view.layer.masksToBounds = true
    }
    
    func roundViewAtCorners(_ rectCorner: UIRectCorner, radii: CGSize, rect: CGRect) {
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect: rect, byRoundingCorners: rectCorner, cornerRadii: radii).cgPath
        self.layer.mask = maskLayer
    }
    
    // Not use
    class func maskedImageFrom(_ image: UIImage) -> UIImage {
        let maskImage = UIImage(named: "mask")!
        let maskRef = maskImage.cgImage
        
        let mask = CGImage(maskWidth: (maskRef?.width)!, height: (maskRef?.height)!, bitsPerComponent: (maskRef?.bitsPerComponent)!, bitsPerPixel: (maskRef?.bitsPerPixel)!, bytesPerRow: (maskRef?.bytesPerRow)!, provider: (maskRef?.dataProvider!)!, decode: nil, shouldInterpolate: false)
        let masked = image.cgImage?.masking(mask!)
        
        // Create image from CGImageRef
        let maskedImage = UIImage(cgImage: masked!)
        return maskedImage
    }
}
