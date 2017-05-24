//
//  RegisterViewController.swift
//  GiaSu
//
//  Created by hoangha052 on 4/22/17.
//  Copyright © 2017 hoangha052. All rights reserved.
//

import UIKit
import YangMingShan

class RegisterViewController: BaseViewController, YMSPhotoPickerViewControllerDelegate {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(showImageSelectPicker))
        profileImageView.addGestureRecognizer(tapGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextButtonClick(_ sender: Any) {
        let user = UserManager.sharedInstance.loggedInUser
        user?.email =  emailTextField.text!
        user?.password = passwordTextField.text!
        user?.phone = phoneTextField.text!
        user?.address = addressTextField.text!
        user?.username = nameTextField.text!
        UserManager.sharedInstance.loggedInUser = user
        self.performSegue(withIdentifier: "SelectSubjectSegue", sender: nil)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
    }
 
    
    // MARK: - YMSPhotoPickerViewControllerDelegate
    func showImageSelectPicker(_ sender: UITapGestureRecognizer) {
//        let pickerViewController = YMSPhotoPickerViewController.init()
//        pickerViewController.delegate = self
//        pickerViewController.numberOfPhotoToSelect = 1

//        self.yms_presentCustomAlbumPhotoView(pickerViewController, delegate: self)
        self.yms_presentAlbumPhotoView(with: self)
    }
    
    
    // MARK yms ImagePicker Delegate
    func photoPickerViewControllerDidReceivePhotoAlbumAccessDenied(_ picker: YMSPhotoPickerViewController!) {
        let alertController = UIAlertController.init(title: "Allow photo album access?", message: "Need your permission to access photo albumbs", preferredStyle: .alert)
        let dismissAction = UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil)
        let settingsAction = UIAlertAction.init(title: "Settings", style: .default) { (action) in
            UIApplication.shared.openURL(URL.init(string: UIApplicationOpenSettingsURLString)!)
        }
        alertController.addAction(dismissAction)
        alertController.addAction(settingsAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    func photoPickerViewControllerDidReceiveCameraAccessDenied(_ picker: YMSPhotoPickerViewController!) {
        let alertController = UIAlertController.init(title: "Allow camera album access?", message: "Need your permission to take a photo", preferredStyle: .alert)
        let dismissAction = UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil)
        let settingsAction = UIAlertAction.init(title: "Settings", style: .default) { (action) in
            UIApplication.shared.openURL(URL.init(string: UIApplicationOpenSettingsURLString)!)
        }
        alertController.addAction(dismissAction)
        alertController.addAction(settingsAction)
        
        // The access denied of camera is always happened on picker, present alert on it to follow the view hierarchy
        picker.present(alertController, animated: true, completion: nil)
    }
    

    func photoPickerViewController(_ picker: YMSPhotoPickerViewController!, didFinishPicking image: UIImage!) {
        picker.dismiss(animated: true) { 
            self.profileImageView.image = image
            UserManager.sharedInstance.loggedInUser?.imageProfile = image
        }
        
    }
    
//    func photoPickerViewController(_ picker: YMSPhotoPickerViewController!, didFinishPickingImages photoAssets: [PHAsset]!) {
//        // Remember images you get here is PHAsset array, you need to implement PHImageManager to get UIImage data by yourself
//        picker.dismiss(animated: true) {
//            let imageManager = PHImageManager.init()
//            let options = PHImageRequestOptions.init()
//            options.deliveryMode = .highQualityFormat
//            options.resizeMode = .exact
//            options.isSynchronous = true
//            
//            let mutableImages: NSMutableArray! = []
//            
//            for asset: PHAsset in photoAssets
//            {
//                //                let scale = UIScreen.main.scale
//                let targetSize = CGSize.init(width: asset.pixelWidth, height: asset.pixelHeight)
//                imageManager.requestImage(for: asset, targetSize: targetSize, contentMode: .aspectFill, options: options, resultHandler: { (image, info) in
//                    mutableImages.add(image!)
//                })
//            }
//            // Assign to Array with images
//            self.listImage = mutableImages.copy() as? [UIImage]
//            self.listImageView.items.removeAll()
//            self.listImageView.delegate = self
//        }
//    }


}
