//
//  UITableViewExtension.swift
//  Bartr
//
//  Created by Thuy Luong on 7/23/16.
//  Copyright © 2016 Thuy Luong. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func insertLastRowInSection(_ section: Int, animation: UITableViewRowAnimation) {
        let lastIndexInSection = self.numberOfRows(inSection: section)
        self.insertRows(at: [IndexPath(row: lastIndexInSection, section: section)], with:animation)
    }
    
    func scrollToLastRow() {
        let lastSectionIndex = self.numberOfSections - 1
        let lastRowIndex = self.numberOfRows(inSection: lastSectionIndex) - 1
        self.scrollToRow(at: IndexPath(row: lastRowIndex, section: lastSectionIndex), at: UITableViewScrollPosition.bottom, animated: true)
    }
    
    func addEmptyImageView() {
        let emptyView: UIView = UIView.init(frame: self.frame)
        emptyView.backgroundColor = UIColor(rgba: AppColors.sentOfferCellBackground)
        let imageView: UIImageView = UIImageView.init(image: UIImage.init(named: "logo_grey"))
        emptyView.addSubview(imageView)
        
        imageView.snp.makeConstraints { (make) in
            make.height.width.equalTo(112)
            make.centerX.equalTo(emptyView)
            make.centerY.equalTo(emptyView)
        }
        
        self.backgroundView = emptyView
    }

}
