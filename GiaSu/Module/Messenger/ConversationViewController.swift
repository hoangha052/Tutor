//
//  ConversationViewController.swift
//  WorkID
//
//  Created by hoangha052 on 5/25/17.
//  Copyright © 2017 hoangha052. All rights reserved.
//

import UIKit
import Firebase

class ConversationViewController: BaseViewController {

    @IBOutlet weak var containerView: UIView!
//    var messagesVC = ChatViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setUpLeftButton(imageName: "ic_back", title: nil)
        self.navigationController?.setUpTitle(title: "Conversation", titleColor: UIColor.init(rgba: AppColors.main))

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func reloadView() {
        let messagesVC = MessageViewController()
        messagesVC.converstationRoomKey = "123"
//        messagesVC.converstationRoom = self.converstationRoom
//        if let userId = UserManager().savedUser()?.userId {
//            messagesVC.senderId = String(userId)
//        }
        
        messagesVC.senderDisplayName = "Hatest"
        
        self.addChildViewController(messagesVC)
        messagesVC.view.frame = CGRect(x: 0, y: 0, width: self.containerView.frame.size.width, height: self.containerView.frame.size.height);
        self.containerView.addSubview(messagesVC.view)
        
        messagesVC.view.snp.makeConstraints{ (make) in
            make.leading.equalTo(self.containerView)
            make.top.equalTo(self.containerView)
            make.trailing.equalTo(self.containerView)
            make.bottom.bottom.equalTo(self.containerView)
        }
        messagesVC.didMove(toParentViewController: self)
    }

    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ChatViewSegue" {
            let chatVC = segue.destination as! MessageViewController
            chatVC.converstationRoomKey = "123"
            chatVC.senderId = "123"
            chatVC.senderDisplayName = "Hatest"
        }
    }
    

}
