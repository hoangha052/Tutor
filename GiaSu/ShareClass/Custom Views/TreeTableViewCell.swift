//
//  TreeTableViewCell.swift
//  RATreeViewExamples
//
//  Created by Rafal Augustyniak on 22/11/15.
//  Copyright © 2015 com.Augustyniak. All rights reserved.
//

import UIKit

enum ProjectType: Int {
    case rootLevel = 0
    case subLevel
    case expanded
    
}

class TreeTableViewCell : UITableViewCell {

    @IBOutlet private weak var customTitleLabel: UILabel!
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var trailingConstraintLabel: NSLayoutConstraint!
    

    var projectData: Project?
    var subProjectData: SubProject?
    var cellType: ProjectType = .rootLevel

    var isSelectedCell: Bool = false {
        willSet {
            // Print current value.
            print("willSet")
        }
        didSet {
            // Print both oldValue and present value.
            print("didSet")
            var imageName = "ic_row_right"
            switch self.cellType {
            case .rootLevel:
                imageName = "ic_row_right"
                break
            case .subLevel:
                imageName = isSelectedCell ? "ic_check" : "ic_check_white"
                break
            case .expanded:
                imageName = "ic_row_dow"
                break
                
            }
            self.imageCell.image = UIImage.init(named: imageName)

        }
    }
    
    override func awakeFromNib() {
        selectedBackgroundView? = UIView()
        selectedBackgroundView?.backgroundColor = .clear
    }

    
    var additionButtonActionBlock : ((TreeTableViewCell) -> Void)?;


    @IBAction func selectButtonClick(_ sender: Any) {
    }
    func additionButtonTapped(_ sender : AnyObject) -> Void {
        if let action = additionButtonActionBlock {
            action(self)
        }
    }

//    func configRootCell(_ project: Project) {
//        self.customTitleLabel.text = project.subject!
//        self.projectData = project
//    }
//    
//    func configSubCell(_ subProject: SubProject) {
//        self.customTitleLabel.text = subProject.level!
//        self.subProjectData = subProject
//        self.cellType = .subLevel
//    }
    
    func configCell(_ data : AnyObject) {
        if let project = data as? Project {
            self.customTitleLabel.text = project.subject!
            self.projectData = project
            self.cellType = project.levels != nil ? ProjectType.rootLevel : ProjectType.subLevel
        }
//        else {
//            let subProject = data as! SubProject
//            self.customTitleLabel.text = subProject.level!
//            self.subProjectData = subProject
//            self.cellType = .subLevel
//            self.trailingConstraintLabel.constant = 20
//        }   
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        var imageName = "ic_row_right"
        switch self.cellType {
        case .rootLevel:
            imageName = "ic_row_right"
            break
        case .subLevel:
            imageName = selected ? "ic_check" : "ic_check_white"
            break
        case .expanded:
            imageName = "ic_row_dow"
            break

        }
        self.imageCell.image = UIImage.init(named: imageName)
    }
    
}
