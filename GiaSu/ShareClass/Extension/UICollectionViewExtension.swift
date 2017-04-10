//
//  UICollectionViewExtension.swift
//  Bartr
//
//  Created by Thuy Luong on 5/16/16.
//  Copyright © 2016 Thuy Luong. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    func setupCollectionViewLayout(sectionInset inset: UIEdgeInsets, itemSize: CGSize, minInteritemSpacing:CGFloat, minLineSpacing: CGFloat){
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = inset
        layout.itemSize = itemSize
        layout.minimumInteritemSpacing = minInteritemSpacing
        layout.minimumLineSpacing = minLineSpacing
        self.collectionViewLayout = layout
    }
}