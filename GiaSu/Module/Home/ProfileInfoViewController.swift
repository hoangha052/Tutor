//
//  ProfileInfoViewController.swift
//  GiaSu
//
//  Created by hoangha052 on 4/3/17.
//  Copyright © 2017 hoangha052. All rights reserved.
//

import UIKit

class ProfileInfoViewController: BaseViewController {
    @IBOutlet weak var imageProfileView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var yearOldLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var expLabel: UILabel!
    @IBOutlet weak var btnMessenger: UIButton!
    @IBOutlet weak var btnFavorite: UIButton!
    
    var userInfo: User?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("profileViewController")
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.showProfileDetail(_:)))
        imageProfileView.addGestureRecognizer(tapGesture)
        self.showUserInfo(userData: userInfo!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnMessengerClick(_ sender: Any) {
    }
    
    @IBAction func btnFavoriteClick(_ sender: Any) {
        
    }
    
    func showProfileDetail(_ sender: UITapGestureRecognizer) {
        let detailVC = UIStoryboard.tnr_createViewController(storyboardName: "Main",viewControllerIdentifier: "ProfileDetailViewController")
        
        self.present(detailVC, animated: true, completion: nil)
    }
    
    func showUserInfo(userData: User) {
        self.nameLabel.text = userData.descriptionStr!
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
