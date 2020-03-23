//
//  Profile_ViewController.swift
//  Fitness-App
//
//  Created by Netventure on 09/03/20.
//  Copyright © 2020 freelancer. All rights reserved.
//


import UIKit
import AMTabView
import SDWebImage
import AVFoundation
import Photos

class Profile_ViewController: UIViewController , TabItem {
    @IBOutlet weak var phusicalDetailView: UIView!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var bodyfatLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var profileImage_View: UIImageView!
    @IBOutlet weak var profileTableView: UITableView!
    @IBOutlet weak var detailView: UIView!
    
    @IBOutlet weak var scrollview_Constraint: NSLayoutConstraint!
    
    var profileModel : ProfileDetailModel? = nil
    var oldContentOffset = CGPoint.zero
    let topConstraintRange = (CGFloat(0)..<CGFloat(150))
    private var lastContentOffset: CGFloat = 0
    var tabImage: UIImage? {
        return UIImage(named: "user")
    }
    
    var encoded: String = ""
    var base64Image:String  = ""
    var imageData : Data?
     let imagePicker = UIImagePickerController()
    var profileImg : UIImage?
    var profileImage: UIImage?
    var profileimageurl = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phusicalDetailView.layer.cornerRadius = 6.0
        phusicalDetailView.layer.masksToBounds = true
        profileImage_View.layer.cornerRadius =  profileImage_View.frame.height / 2
        profileImage_View.layer.masksToBounds = true
        detailView.layer.cornerRadius =  6.0
        detailView.layer.masksToBounds = true
        imagePicker.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        scrollview_Constraint.constant = 0
        profileApi()
    }
    
    @IBAction func cameraButtonTapped(_ sender: Any) {
        self.profileImageClicked()
    }
    func profileApi(){
        WebService.shared.ProfileListAPI { (success, errorMessage, model) in
            if success{
                self.profileModel = model
                UserDefaults.standard.set((self.profileModel?.data?.email)!, forKey: "email")
                UserDefaults.standard.set((self.profileModel?.data?.phone)!, forKey: "mobile")
            }else{
                self.profileModel = nil
            }
            DispatchQueue.main.async {
                if self.profileModel != nil {
                    self.profileImage_View!.sd_setImage(with: URL(string: (self.profileModel?.data?.profile_picture)!), placeholderImage: UIImage(named: "dummy_User.png"), options: .lowPriority, completed: nil)
                }
                
                self.heightLabel.text = "170"//self.profileModel != nil ? self.profileModel?.data. :
                self.weightLabel.text = self.profileModel != nil ? (self.profileModel?.data?.starting_weight)! : ""
                self.bodyfatLabel.text = self.profileModel != nil ? (self.profileModel?.data?.starting_body_fat)! : ""
                self.nameLabel.text = self.profileModel != nil ? (self.profileModel?.data?.name)! : ""
                self.profileTableView.reloadData()
            }
        }

    }
    
    @IBAction func buttonEditTapped(_ sender: Any) {
        debugPrint("edit ")
    }
    
    @IBAction func buttonLogoutTapped(_ sender: Any) {
        WebService.shared.signOutAPI { (success, error, model) in
            if success{
                UserDefaults.standard.removeObject(forKey: "logged")
            }else{
              UserDefaults.standard.removeObject(forKey: "logged")
            }
        }
        self.showAlert(message: "Successfully logged out.")
        debugPrint("logout ")
    }
    
    func showAlert(message: String){
        debugPrint("alert")
        let alert = UIAlertController(title: FITNESSAPP_TITLE, message: message, preferredStyle:.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            let appdelegate = UIApplication.shared.delegate as! AppDelegate
            appdelegate.launcherPage()
        }))
        self.present(alert, animated: true, completion: nil)
        }
}

extension Profile_ViewController : UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7 + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = profile_TableViewCell()
        if indexPath.row == 7{
            return UITableViewCell()
        }else{
            switch indexPath.row {
            case 0:
                cell = tableView.dequeueReusableCell(withIdentifier: "profile_TableViewCell0", for: indexPath) as! profile_TableViewCell
                cell.mobileNumberLabel.text = self.profileModel != nil ? (self.profileModel?.data?.phone)! : ""
            case 1:
                cell = tableView.dequeueReusableCell(withIdentifier: "profile_TableViewCell1", for: indexPath) as! profile_TableViewCell
                cell.mailIDLabel.text = self.profileModel != nil ? (self.profileModel?.data?.email)! : ""
            case 2:
                cell = tableView.dequeueReusableCell(withIdentifier: "profile_TableViewCell2", for: indexPath) as! profile_TableViewCell
                cell.dobLabel.text = self.profileModel != nil ? (self.profileModel?.data?.date_of_birth)! : ""
            case 3:
                cell = tableView.dequeueReusableCell(withIdentifier: "profile_TableViewCell3", for: indexPath) as! profile_TableViewCell
                cell.joiningDateLabel.text = self.profileModel != nil ? (self.profileModel?.data?.starting_date)! : ""
            case 4:
                cell = tableView.dequeueReusableCell(withIdentifier: "profile_TableViewCell4", for: indexPath) as! profile_TableViewCell
                cell.reviewDateLabel.text = self.profileModel != nil ? (self.profileModel?.data?.review_date)! : ""
            case 5:
                cell = tableView.dequeueReusableCell(withIdentifier: "profile_TableViewCell5", for: indexPath) as! profile_TableViewCell
                cell.goalsLabel.text = self.profileModel != nil ? (self.profileModel?.data?.goal)! : ""
            default:
                cell = tableView.dequeueReusableCell(withIdentifier: "profile_TableViewCell6", for: indexPath) as! profile_TableViewCell
                cell.separatorInset = UIEdgeInsets.init(top: 0, left: 100000, bottom: 0, right: 0)
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 7{
            return 35.0
        }else{
            return UITableView.automaticDimension
        }
    }
}


extension Profile_ViewController : UIImagePickerControllerDelegate,UINavigationControllerDelegate{
        func profileImageClicked() {
            let actionSheet = UIAlertController(title: "Please Choose The Below Options", message: nil, preferredStyle: .actionSheet)
            let cameraButton = UIAlertAction(title: "Camera", style: .default, handler: {(actonsheet)-> Void in
                self.cameraButtonAction()
            })
            let libraryButton = UIAlertAction(title: "Library", style: .default, handler: {(actonsheet)-> Void in
                self.libraryButtonAction()
            })
            let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: {(actonsheet) -> Void in
    //handle cancel
            })
            actionSheet.addAction(cameraButton)
            actionSheet.addAction(libraryButton)
            actionSheet.addAction(cancelButton)
            self.present(actionSheet, animated: true, completion: nil)
        }
    
    func cameraButtonAction() {
        if AVCaptureDevice.authorizationStatus(for: AVMediaType.video) == AVAuthorizationStatus.authorized {
            imagePicker.allowsEditing = true
            imagePicker.sourceType = .camera
            present(imagePicker, animated: true, completion: nil)
        } else {
            AVCaptureDevice.requestAccess(for: .video, completionHandler: {(granted: Bool) -> Void in
                DispatchQueue.main.async {
                    if !(AVCaptureDevice.authorizationStatus(for: AVMediaType.video) == AVAuthorizationStatus.authorized) {
                        let alert = UIAlertController(title: "FADA Would Like to Access the Camera", message: "Allow FADA to take pictures?. This will allow the user to set their profile picture and sending the image to the chat.", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Setting", style: .default, handler: { (_) in
                            DispatchQueue.main.async {
                                if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
                                    if #available(iOS 10.0, *) {
                                        UIApplication.shared.open(settingsURL, options:[:], completionHandler: nil)
                                    } else {
                                        // Fallback on earlier versions
                                    }
                                }
                            }
                        }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            (alertAction) in
                            alert.dismiss(animated: true, completion: nil)
                        }))
                        self.present(alert, animated: true, completion: nil)
                    }
                }
            })
        }
    }
    
    func libraryButtonAction() {
        DispatchQueue.main.async {
            let photoLibraryAuthStatus = PHPhotoLibrary.authorizationStatus()
            switch photoLibraryAuthStatus {
            case .notDetermined:
                PHPhotoLibrary.requestAuthorization({ (newStatus) in
                    if (newStatus == PHAuthorizationStatus.authorized) {
                        DispatchQueue.main.async {
                        self.imagePicker.allowsEditing = true
                        self.imagePicker.sourceType = .photoLibrary
                        self.present(self.imagePicker, animated: true, completion: nil)
                    }
                    }
                })
            case .restricted:
                break
            case .denied:
                DispatchQueue.main.async {
                    if .denied == PHPhotoLibrary.authorizationStatus() {
                        let alert = UIAlertController(title: "FADA Would Like to Access Your Photos", message: "For choosing the photo for your personal profile data update.", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Setting", style: .default, handler: { (_) in
                            DispatchQueue.main.async {
                                if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
                                    if #available(iOS 10.0, *) {
                                        UIApplication.shared.open(settingsURL, options:[:], completionHandler: nil)
                                    } else {
                                        // Fallback on earlier versions
                                    }
                                }
                            }
                        }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                            (alertAction) in
                            alert.dismiss(animated: true, completion: nil)
                        }))
                        self.present(alert, animated: true, completion: nil)
                    }
                }
            case .authorized:
                self.imagePicker.allowsEditing = true
                self.imagePicker.sourceType = .photoLibrary
                self.present(self.imagePicker, animated: true, completion: nil)
            }
        }
       
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            profileImg = pickedImage
            imageData = profileImg!.jpegData(compressionQuality: 0.5)!
            encoded = imageData!.base64EncodedString(options: .endLineWithCarriageReturn)
            profileImage = pickedImage
        }else if let pickedImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            profileImg = pickedImage
            imageData = profileImg!.jpegData(compressionQuality: 0.5)!
            profileImage = pickedImage
            encoded = imageData!.base64EncodedString(options: .endLineWithCarriageReturn)
         }
        profileimageurl = encoded
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
