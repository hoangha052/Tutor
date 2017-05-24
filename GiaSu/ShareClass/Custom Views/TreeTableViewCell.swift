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
    
}

class TreeTableViewCell : UITableViewCell {

    @IBOutlet private weak var additionalButton: UIButton!
    @IBOutlet private weak var detailsLabel: UILabel!
    @IBOutlet private weak var customTitleLabel: UILabel!

    var projectData: Project?
    var subProjectData: SubProject?
    var cellType: ProjectType = .rootLevel
    private var additionalButtonHidden : Bool {
        get {
            return additionalButton.isHidden;
        }
        set {
            additionalButton.isHidden = newValue;
        }
    }

    override func awakeFromNib() {
        selectedBackgroundView? = UIView()
        selectedBackgroundView?.backgroundColor = .clear
    }

    var additionButtonActionBlock : ((TreeTableViewCell) -> Void)?;

    func setup(withTitle title: String, detailsText: String, level : Int, additionalButtonHidden: Bool) {
        customTitleLabel.text = title
        detailsLabel.text = detailsText
        self.additionalButtonHidden = additionalButtonHidden

        let backgroundColor: UIColor
        if level == 0 {
            backgroundColor = UIColor(red: 247.0/255.0, green: 247.0/255.0, blue: 247.0/255.0, alpha: 1.0)
        } else if level == 1 {
            backgroundColor = UIColor(red: 209.0/255.0, green: 238.0/255.0, blue: 252.0/255.0, alpha: 1.0)
        } else {
            backgroundColor = UIColor(red: 224.0/255.0, green: 248.0/255.0, blue: 216.0/255.0, alpha: 1.0)
        }
        
        self.backgroundColor = backgroundColor
        self.contentView.backgroundColor = backgroundColor

        let left = 11.0 + 20.0 * CGFloat(level)
        self.customTitleLabel.frame.origin.x = left
        self.detailsLabel.frame.origin.x = left
    }

    @IBAction func selectButtonClick(_ sender: Any) {
    }
    func additionButtonTapped(_ sender : AnyObject) -> Void {
        if let action = additionButtonActionBlock {
            action(self)
        }
    }

    func configRootCell(_ project: Project) {
        self.customTitleLabel.text = project.subject!
        self.projectData = project
    }
    
    func configSubCell(_ subProject: SubProject) {
        self.customTitleLabel.text = subProject.level!
        self.subProjectData = subProject
        self.cellType = .subLevel
    }
    
    func configCell(_ data : AnyObject) {
        if let project = data as? Project {
            self.customTitleLabel.text = project.subject!
            self.projectData = project
            self.cellType = ((project.levels?.count)! > 0) ? ProjectType.rootLevel : ProjectType.subLevel
        } else {
            let subProject = data as! SubProject
            self.customTitleLabel.text = subProject.level!
            self.subProjectData = subProject
            self.cellType = .subLevel
        }
    }
}
