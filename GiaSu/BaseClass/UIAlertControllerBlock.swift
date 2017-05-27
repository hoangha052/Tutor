//
//  UIAlertControllerBlock.swift
//  WeTrade
//
//  Created by admin on 3/08/17.
//  Copyright © 2017 admin. All rights reserved.
//
import UIKit

class UIAlertControllerBlock: NSObject {
	class func alertView(withTitle titleText: String?,
		messageText: String?,
		cancelTitle: String?,
		arrayButton: [String]?,
		presentInViewController: UIViewController,
		clickButtonComplete: ((UIAlertAction) -> Void)?,
		cancelCompleteBlock: ((UIAlertAction) -> Void)?){
			if cancelTitle != nil || arrayButton != nil{
				let alertController: UIAlertController = UIAlertController(title: titleText, message: messageText, preferredStyle: .alert)
				
				if cancelTitle != nil{
					let cancel = UIAlertAction(title: cancelTitle, style: .default, handler: { (action) -> Void in
						if cancelCompleteBlock != nil{
							cancelCompleteBlock!(action)
						}
					})
					
					alertController.addAction(cancel)
				}
				
				if arrayButton != nil{
					for element in arrayButton!{
						let alertAction = UIAlertAction(title: element, style: .default, handler: { (action) -> Void in
							if clickButtonComplete != nil{
								clickButtonComplete!(action)
							}
						})
						
						alertController.addAction(alertAction)
					}
				}
				
				presentInViewController.present(alertController, animated: true, completion: nil)
			}
	}
	
	static func showCancelAlert(presentInViewController: UIViewController, _ title:String, _ message:String, _ cancelBlock:@escaping (() -> Void)) {
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		
		let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (action:UIAlertAction) -> Void in
			cancelBlock()
		}
		
		alert.addAction(cancel)
		
		presentInViewController.present(alert, animated: true, completion: nil)
	}
	
	static func showOkAlert(presentInViewController: UIViewController, _ title:String, _ message:String, _ okBlock:@escaping (() -> Void)) {
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		
		let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) -> Void in
			okBlock()
		}
		
		alert.addAction(ok)
		
		presentInViewController.present(alert, animated: true, completion: nil)
	}
	
	static func showBasicAlert(presentInViewController: UIViewController, _ title:String, _ message:String, _ cancelBlock:@escaping (() -> Void), _ okBlock:@escaping (() -> Void)) {
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		
		let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (action:UIAlertAction) -> Void in
			cancelBlock()
		}
		
		let ok = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default) { (action:UIAlertAction) -> Void in
			okBlock()
		}
		
		alert.addAction(cancel)
		alert.addAction(ok)
		
		presentInViewController.present(alert, animated: true, completion: nil)
	}
	
	static func showYesNoAlert(presentInViewController: UIViewController, _ title:String, _ message:String, _ noBlock:@escaping (() -> Void), _ yesBlock:@escaping (() -> Void)) {
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		
		let no = UIAlertAction(title: "No", style: UIAlertActionStyle.cancel) { (action:UIAlertAction) -> Void in
			noBlock()
		}
		
		let yes = UIAlertAction(title: "Yes", style: UIAlertActionStyle.default) { (action:UIAlertAction) -> Void in
			yesBlock()
		}
		
		alert.addAction(no)
		alert.addAction(yes)
		
		presentInViewController.present(alert, animated: true, completion: nil)
	}
}
