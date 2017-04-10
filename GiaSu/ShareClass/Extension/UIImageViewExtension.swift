//
//  UIImageViewExtension.swift
//  Bartr
//
//  Created by Thuy Luong on 7/4/16.
//  Copyright © 2016 Thuy Luong. All rights reserved.
//

import Foundation
import Kingfisher

extension UIImageView {
    
    var colorPattern: String? {
        get {
            return nil
        }
        
        set {
            self.backgroundColor = UIColor(patternImage: UIImage(named: newValue!)!)
        }
    }
    
    func setImageUrl(_ url: URL, placeholderImage: UIImage?, optionsInfo: KingfisherOptionsInfo?, roundImage: Bool) {
        self.kf.setImage(with: url,
                              placeholder: placeholderImage,
                              options: optionsInfo,
                              progressBlock: nil,
                              completionHandler: { (image, error, cacheType, imageURL) -> () in
                                if roundImage {
                                    DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.default).async(execute: {
                                        let roundedImage = image?.roundedImageWithSize(self.frame.size)
                                        DispatchQueue.main.async(execute: {
                                            self.image = roundedImage
                                        })
                                    })
                                }
                                else {
                                    self.image = image
                                }
        })

    }
}
