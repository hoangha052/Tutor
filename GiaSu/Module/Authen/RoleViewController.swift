//
//  RoleViewController.swift
//  GiaSu
//
//  Created by hoangha052 on 5/14/17.
//  Copyright © 2017 hoangha052. All rights reserved.
//

import UIKit

class RoleViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func teacherButtonClick(_ sender: Any) {
        self.performSegue(withIdentifier: "UserInfoSegue", sender: nil)
    }

    @IBAction func studentButtonClick(_ sender: Any) {
                self.performSegue(withIdentifier: "UserInfoSegue", sender: nil)
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
