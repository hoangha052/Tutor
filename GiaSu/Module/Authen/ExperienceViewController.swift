//
//  ExperienceViewController.swift
//  GiaSu
//
//  Created by hoangha052 on 5/14/17.
//  Copyright © 2017 hoangha052. All rights reserved.
//

import UIKit

class ExperienceViewController: BaseViewController {
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var introduceTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextButtonClick(_ sender: Any) {
       let userRegister = UserManager.sharedInstance.loggedInUser
        userRegister?.price = Int(priceTextField.text!)
        userRegister?.descriptionStr = introduceTextView.text!
        self.registerUser(userData: userRegister!)
    }

    func registerUser(userData: User) {
//        self.showLoaddingView()
        UserProvider().registerUser(userRegister: userData) { (response) in
            self.hideLoaddingView()
            if (response?.noError())! {
            if let userValue = response?.userData  {
                UserManager.sharedInstance.saveUser(userValue)
                self.gotoMainView()
                }
            } else {
                self.loadDataFail((response?.error())!)
            }

        }

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
