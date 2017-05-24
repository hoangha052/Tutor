//
//  ViewController.swift
//  GiaSu
//
//  Created by hoangha052 on 3/30/17.
//  Copyright © 2017 hoangha052. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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

