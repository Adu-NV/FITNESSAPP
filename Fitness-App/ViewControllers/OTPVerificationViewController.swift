//
//  OTPVerificationViewController.swift
//  Fitness-App
//
//  Created by Netventure on 16/03/20.
//  Copyright © 2020 freelancer. All rights reserved.
//

import UIKit

class OTPVerificationViewController: UIViewController {

        let storyboardValue = UIStoryboard.init(name: "Main", bundle: nil)
    var emailId = ""
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet var otpTextField: [LineTextField]!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var otpCenterConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        checkButton.setCornerRadius(radius: 6.0)
        backButton.setCornerRadius(radius: 6.0)
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
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardHide(notification:)), name:UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardShow(notification:)), name:UIResponder.keyboardWillShowNotification, object: nil)
        let _tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(_tap)
        setUI()
    }
    
    @IBAction func checkButtonTapped(_ sender: Any) {
        if checkTextFields(){
            
        }else{
            self.showAlert(message: "Please fill all the fields")
        }
    }
    
    @objc func keyboardShow(notification:Notification){
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            self.otpCenterConstraint.constant = -50
        }
        
        UIView.animate(withDuration: 0.5) {
            self.view.layoutSubviews()
        }
    }
    
    @objc func keyboardHide(notification:Notification){
        self.otpCenterConstraint.constant = 0
        UIView.animate(withDuration: 0.5) {
            self.view.layoutSubviews()
        }
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    func checkTextFields() -> Bool{
        var returnValue = true
        for i in 0 ..< 6{
            if otpTextField[i].text!.isEmpty{
                 returnValue = false
            }
        }
        return returnValue
    }
    
    func showAlert(message : String){
        let alert = UIAlertController(title: FITNESSAPP_TITLE, message: message, preferredStyle:.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            
        }))
        self.present(alert, animated: true, completion: nil)
    }
}


extension OTPVerificationViewController : UITextFieldDelegate{
    @objc func textFieldDidChange(textField: UITextField){
        let text = textField.text
        if (text?.utf16.count)! >= 1{
            switch textField.tag{
            case 0:
                otpTextField[1].becomeFirstResponder()
            case 1:
                otpTextField[2].becomeFirstResponder()
            case 2:
                otpTextField[3].becomeFirstResponder()
            case 3:
                otpTextField[4].becomeFirstResponder()
            case 4:
                otpTextField[5].becomeFirstResponder()
            case 5:
                otpTextField[5].resignFirstResponder()
            default:
                break
            }
        }else{
            // do coding
        }
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    func setUI(){
        DispatchQueue.main.async {
                    for i in 0 ..< 6{
                        self.otpTextField[i].isSecureTextEntry = true
                        self.otpTextField[i].addTarget(self, action: #selector(self.textFieldDidChange), for: .editingChanged)
            }
        }

    }
    
}
