//
//  ChatViewController.swift
//  WorkID
//
//  Created by hoangha052 on 5/25/17.
//  Copyright © 2017 hoangha052. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import JSQMessagesViewController

class MessageViewController: JSQMessagesViewController {

    // MARK: Properties
    var converstationRoomKey : String?
//    var converstationRoom: Converstation!
//    let rootRef: FIRDatabaseReference = FIRDatabase.database().reference(withPath: Constants.FIREBASE)
//    var messageRef: FIRDatabaseReference!
    
    var messages = [JSQMessage]()
//    var listChats = [Message]()
    
    var imageAvatarUserView: UIImageView?
    var imageAvatarFriendView: UIImageView?
    
//    var userIsTypingRef: FIRDatabaseReference!
//    var usersTypingQuery: FIRDatabaseQuery!
    fileprivate var localTyping = false
    
    
    var isTyping: Bool {
        get {
            return localTyping
        }
        set {
            localTyping = newValue
//            userIsTypingRef.setValue(newValue)
        }
    }
    
    var outgoingBubbleImageView: JSQMessagesBubbleImage!
    var incomingBubbleImageView: JSQMessagesBubbleImage!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupBubbles()
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

    fileprivate func setupBubbles() {
        let bubbleImageFactory = JSQMessagesBubbleImageFactory()
        outgoingBubbleImageView = bubbleImageFactory?.outgoingMessagesBubbleImage(with: UIColor.init(rgba: AppColors.main))
        incomingBubbleImageView = bubbleImageFactory?.incomingMessagesBubbleImage(with: UIColor.jsq_messageBubbleLightGray())
    }

    override func textViewDidChange(_ textView: UITextView) {
        super.textViewDidChange(textView)
        // If the text is not empty, the user is typing
//        isTyping = textView.text != ""
    }
    
    override func didPressSend(_ button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: Date!) {
        
//        sendMessageToFirebase(MessageType.text, content: text)
        
        // 4
        JSQSystemSoundPlayer.jsq_playMessageSentSound()
        
        // 5
        finishSendingMessage()
//        isTyping = false
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageDataForItemAt indexPath: IndexPath!) -> JSQMessageData! {
        return messages[indexPath.item]
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAt indexPath: IndexPath!) -> JSQMessageBubbleImageDataSource! {
        let message = messages[indexPath.item] // 1
        
        if message.senderId == senderId! { // 2
            return outgoingBubbleImageView
        } else { // 3
            return incomingBubbleImageView
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = super.collectionView(collectionView, cellForItemAt: indexPath) as! JSQMessagesCollectionViewCell
        
        let message = messages[indexPath.item]
        
        if message.senderId == senderId { // 1
            cell.textView!.textColor = UIColor.white // 2
            
        } else {
            cell.textView!.textColor = UIColor.black // 3
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAt indexPath: IndexPath!) -> JSQMessageAvatarImageDataSource! {
        
        let message = messages[indexPath.item] // 1
        
        if message.senderId == senderId! { // 2
            return  JSQMessagesAvatarImageFactory.avatarImage( with: imageAvatarUserView!.image, diameter: 15)
        } else { // 3
            return JSQMessagesAvatarImageFactory.avatarImage( with: imageAvatarFriendView!.image, diameter: 15)
        }
    }
}

