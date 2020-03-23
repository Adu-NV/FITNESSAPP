//
//  ForgotPasswordViewController.swift
//  Fitness-App
//
//  Created by Netventure on 16/03/20.
//  Copyright © 2020 freelancer. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

     let storyboardValue = UIStoryboard.init(name: "Main", bundle: nil)
    @IBOutlet weak var verifyPasswordCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var checkButton: LoadingButton!
    @IBOutlet weak var emailtextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        checkButton.setCornerRadius(radius: 6.0)
        backButton.setCornerRadius(radius: 6.0)
    }
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardHide(notification:)), name:UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardShow(notification:)), name:UIResponder.keyboardWillShowNotification, object: nil)
        let _tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(_tap)
    }
    
    @objc func keyboardShow(notification:Notification){
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            self.verifyPasswordCenterConstraint.constant = -50
        }
        
        UIView.animate(withDuration: 0.5) {
            self.view.layoutSubviews()
        }
    }
    
    @objc func keyboardHide(notification:Notification){
        self.verifyPasswordCenterConstraint.constant = 0
        UIView.animate(withDuration: 0.5) {
            self.view.layoutSubviews()
        }
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
 
    @IBAction func checkButtonTapped(_ sender: Any) {
        checkButton.showLoading()
        if emailtextField.text!.isEmpty{
            self.showAlert(message: "Fill the email field to continue.")
            checkButton.hideLoading(with: "CHECK")
        }else{
            WebService.shared.emailVerification(body: ["email":emailtextField.text!]) { (success, error, model) in
                self.checkButton.hideLoading(with: "CHECK")
                if success{
                    if let _ = model?.data{
                        let forgot =  self.storyboardValue.instantiateViewController(withIdentifier: "OTPVerificationViewController") as! OTPVerificationViewController
                        forgot.emailId = self.emailtextField.text!
                        if #available(iOS 13.0, *) {
                            self.navigationController?.pushViewController(forgot, animated: false)
                        }else{
                            self.present(forgot, animated: false, completion: nil)
                        }
                        //OTPVerificationViewController
                        debugPrint("password")
                    }else{
                        self.showAlert(message: (model?.message)!)
                    }
                }else{
                    self.showAlert(message:error!)
                }
            }
        }
    }
    
    func showAlert(message : String){
        let alert = UIAlertController(title: FITNESSAPP_TITLE, message: message, preferredStyle:.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        if #available(iOS 13.0, *) {
            if let navController = self.navigationController {
                navController.popViewController(animated: true)
            }
        }else{
            self.dismiss(animated: false, completion: nil)
        }
    }
}

extension ForgotPasswordViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        emailtextField.resignFirstResponder()
        checkButtonTapped(checkButton)
        return true
    }
}
