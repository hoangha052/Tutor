//
//  MessengersViewController.swift
//  WorkID
//
//  Created by hoangha052 on 5/25/17.
//  Copyright © 2017 hoangha052. All rights reserved.
//

import UIKit

class MessengersViewController: BaseViewController {
    @IBOutlet weak var messengerTableView: UITableView!
    @IBOutlet weak var searchBarView: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.setUpLeftButton(imageName: "ic_back", title: nil)
        self.navigationController?.setUpTitle(title: "Messengers", titleColor: UIColor.init(rgba: AppColors.main))
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        searchBarView.borderSearchBarWithColor(UIColor.init(rgba: AppColors.main))
//        searchBarView.changeStyleColor(UIColor.init(rgba: AppColors.main))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension MessengersViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - TableView Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 6
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessengerTableViewCell", for: indexPath) as! MessengerTableViewCell
        
//        if indexPath.row == self.listChat.count - 1 && hasNextData {
//            self.loadData(lastKey: self.lastMessageKey)
//        }
//        
//        if let item = self.listChat[safe :indexPath.row] {
//            cell.loadDataCell(item)
//            
//            self.listenNewMessageFromFirebase(item, index: indexPath)
//        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        if self.listChat[indexPath.row].keyID != nil {
//            self.selectedIndexPath = indexPath
//            if self.listChat[indexPath.row].messageStatus == 0 {
//                // change status read message
//                updateStatusReadMessage(self.listChat[indexPath.row], atIndex: indexPath)
//            } else {
//                self.pushToChatDetail(self.listChat[indexPath.row])
//            }
//        }
        self.performSegue(withIdentifier: "ConversationViewSegue", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func deleteRows(at indexPaths: [IndexPath], with animation: UITableViewRowAnimation) {
        print("delecell")
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let button1 = UITableViewRowAction(style: .default, title: "Delete") { action, indexPath in
//            self.deleteMessage(roomChat: self.listChat[indexPath.row], at: indexPath)
        }
//        button1.backgroundColor = UIColor(rgba: AppColors.main)
        
        return [button1]
    }
}
