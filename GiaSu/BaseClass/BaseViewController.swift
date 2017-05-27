//
//  ViewController.swift
//  GiaSu
//
//  Created by hoangha052 on 3/30/17.
//  Copyright © 2017 hoangha052. All rights reserved.
//

import UIKit
import NVActivityIndicatorView


class BaseViewController: UIViewController {
    var activityData: ActivityData?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.activityData = ActivityData.init(size: CGSize.init(width: 60, height: 60), message: nil, messageFont: nil, type: .ballSpinFadeLoader, color: UIColor.init(rgba: AppColors.main) , padding: 0, displayTimeThreshold: 10, minimumDisplayTime: 1, backgroundColor:UIColor.clear)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func gotoMainView() {
        let window: UIWindow = getWindow()
        let mainController = UIStoryboard.tnr_createViewController(storyboardName: "Main")
        window.rootViewController = mainController
    }

    func loginSuccess () {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let vc = UIStoryboard.tnr_createViewController(storyboardName: "Main")
        delegate.window?.rootViewController = vc
    }
    
    func getWindow() -> UIWindow{
        guard let window = UIApplication.shared.keyWindow else {
            return UIApplication.shared.windows.last!
        }
        
        return window
    }
}

//MARK: Action
extension BaseViewController {
    //MARK: - BaseNavigationProtocol
    func popViewController(_ animated: Bool = true) {
        _ = self.navigationController?.popViewController(animated: animated)
    }
    
    func dismisViewController(_ animated: Bool = true) {
        self.navigationController?.dismiss(animated: animated, completion: nil)
    }
    
    func pushNavigationController(storyboardName: String, viewControllerIdentifier: String, _ animation: Bool = true){
        let viewController = UIStoryboard.tnr_createViewController(storyboardName: storyboardName, viewControllerIdentifier: viewControllerIdentifier)
        self.navigationController?.pushViewController(viewController, animated: animation)
    }
    
    //MARK: - PushViewController
    func gotoReviewInformationViewController(){
        let reviewInformationViewController = UIStoryboard.tnr_createViewController(storyboardName: "SignUp", viewControllerIdentifier: "ReviewInformationViewController")
        self.navigationController?.pushViewController(reviewInformationViewController, animated: true)
    }
    
    func gotoMainViewController() {
        let window: UIWindow = getWindow()
        for item in window.subviews {
            item.removeFromSuperview()
        }
        
        let mainController = UIStoryboard.tnr_createViewController(storyboardName: "SideMenu")
        window.rootViewController = mainController
    }
    
    //MARK: - ShowLoaddingView
    func showLoaddingView() {
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(self.activityData!)
    }
    
    func hideLoaddingView() {
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
    }
    
    func showAlertViewWithMessage(message: String, title: String = "") {
        UIAlertControllerBlock.showOkAlert(presentInViewController: self, title, message) {
            self.alertActionButtonOkClick()
        }
    }
    
    func showAlertViewWithServerMessage(message: String) {
        UIAlertControllerBlock.showOkAlert(presentInViewController: self, "", message) {
            self.alertActionButtonOkClick()
        }
    }
    
    func alertActionButtonOkClick() {
        
    }
    
    func loadDataFail(_ error: NSError) {
            if let errorMessage = error.userInfo["message"] as? String {
                self.showAlertViewWithMessage(message: errorMessage)
            }
            else {
                self.showAlertViewWithMessage(message: error.localizedDescription)
            }
    }
    
    func handlePushNotification(notification: [String: AnyObject]){
        
    }
}

