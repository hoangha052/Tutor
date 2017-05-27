//
//  LoginViewController.swift
//  GiaSu
//
//  Created by hoangha052 on 4/22/17.
//  Copyright © 2017 hoangha052. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var forgotButton: UIButton!
    @IBOutlet weak var ruleButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - PrivateFunction
    
    @IBAction func forgotPasswordClick(_ sender: Any) {
    }
    
    @IBAction func ruleButtonClick(_ sender: Any) {
    }
    
    @IBAction func loginButtonClick(_ sender: Any) {
        self.showLoaddingView()
        UserProvider().userLogin(userName: userNameTextField.text!, password: passwordTextField.text!) { (response) in
            self.hideLoaddingView()
            if let userValue = response?.userData  {
                UserManager.sharedInstance.saveUser(userValue)
//                print("userData", userValue)
                self.loginSuccess()
            } else {
                self.loadDataFail((response?.error())!)
            }
        }
    }
    
    @IBAction func registerButtonClick(_ sender: Any) {
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
