//
//  BaseViewViewController.swift
//  ExampleSubclassNavi
//
//  Created by admin on 3/15/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

@objc protocol BaseNavigationProtocol {
    @objc optional func baseNavigationViewController(backButtonAction sender: UIButton)
    @objc optional func baseNavigationViewController(dismissAction sender: UIButton)
    @objc optional func baseNavigationViewController(rightButtonAction sender: UIButton!)
}

open class BaseNavigationViewController: UINavigationController {
    private var mNavigationProtocol: BaseNavigationProtocol!
    
    //MARK: - Life cycle
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.isTranslucent = false
        //hide line bottom navigationbar
        self.navigationBar.setValue(true, forKey: "hidesShadow")
        self.edgesForExtendedLayout = []
        //disable swipe back
        self.interactivePopGestureRecognizer?.isEnabled = false
    }
}

extension UINavigationController{
    func setUpLeftButton(imageName: String?, title: String?, titleColor: UIColor? = nil, isDismiss: Bool = false){
        let viewController = self.visibleViewController
        if let navigationProtocol = viewController as? BaseNavigationProtocol {
            let backButton: UIButton = UIButton(type: .custom)
            
            if imageName != nil {
                backButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
                backButton.setImage(UIImage(named: imageName!), for: .normal)
            }
            else if title != nil {
                let color = currentTitleColor(textColor: titleColor)
                
                backButton.frame = CGRect(x: 0, y: 0, width: 60, height: 40)
                backButton.setTitle(title, for: .normal)
                backButton.setTitleColor(color, for: .normal)
            }
            
            if isDismiss == true {
                backButton.addTarget(navigationProtocol, action: #selector(navigationProtocol.baseNavigationViewController(dismissAction:)), for: UIControlEvents.touchUpInside)
            }
            else {
                backButton.addTarget(navigationProtocol, action: #selector(navigationProtocol.baseNavigationViewController(backButtonAction:)), for: UIControlEvents.touchUpInside)
            }
            
            let negativeSpacer: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
            negativeSpacer.width = -8
            
            viewController?.navigationItem.leftBarButtonItems = [negativeSpacer, UIBarButtonItem(customView: backButton)]
        }
    }
    
    func setUpRightButton(imageName: String?, title: String?, titleColor: UIColor? = nil){
        let viewController = self.visibleViewController
        if let navigationProtocol = viewController as? BaseNavigationProtocol {
            let rightButton: UIButton = UIButton(type: .custom)
            if imageName != nil {
                rightButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
                rightButton.setImage(UIImage(named: imageName!), for: .normal)
            }
            else if title != nil {
                rightButton.frame = CGRect(x: 0, y: 0, width: 60, height: 40)
                rightButton.setTitle(title, for: .normal)
                rightButton.setTitleColor(titleColor, for: .normal)
            }
            
            rightButton.addTarget(navigationProtocol, action: #selector(navigationProtocol.baseNavigationViewController(rightButtonAction:)), for: UIControlEvents.touchUpInside)
            
            let negativeSpacer: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
            negativeSpacer.width = -8
            
            viewController?.navigationItem.rightBarButtonItems = [negativeSpacer, UIBarButtonItem(customView: rightButton)]
        }
    }
    
    func setUpTitle(title: Any?, titleColor: UIColor? = nil){
        let viewController = self.visibleViewController
        if title != nil {
            self.navigationBar.isTranslucent = false
            let color = currentTitleColor(textColor: titleColor)
            let titleLabel = UILabel.init(frame: CGRect(x: 0, y: 0, width: 200, height: 44))
            titleLabel.textColor = color
            titleLabel.font = UIFont(name: "Roboto-Light", size: 15)
            titleLabel.textAlignment = .center
            titleLabel.numberOfLines = 0
            if let title = title as? String{
                titleLabel.text = title
            }
            else if let titleAttribute = title as? NSAttributedString{
                titleLabel.attributedText = titleAttribute
            }
            else{
                titleLabel.text = "\(title)"
            }
            
            viewController?.navigationItem.titleView = titleLabel
        }
    }
    
    func setUpBarTinColor(barTinColor: UIColor?){
        if barTinColor != nil {
            self.navigationBar.barTintColor = barTinColor
        }
    }
    
    private func currentTitleColor(textColor: UIColor?) -> UIColor{
        var color: UIColor!
        if textColor != nil{
            color = textColor
        }
        else{
            color = .white
        }
        
        return color
    }
}
