//
//  LoginViewController.swift
//  Fitness-App
//
//  Created by Netventure on 15/02/20.
//  Copyright © 2020 freelancer. All rights reserved.
//

import UIKit
import AZDialogView

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginButton: LoadingButton!
    @IBOutlet weak var loginViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    let storyboardValue = UIStoryboard.init(name: "Main", bundle: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardHide(notification:)), name:UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardShow(notification:)), name:UIResponder.keyboardWillShowNotification, object: nil)
        let _tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(_tap)
        self.loginButton.setCornerRadius(radius: 5.0)
    }
    
    @objc func keyboardShow(notification:Notification){
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            self.loginViewBottomConstraint.constant = keyboardHeight - 50
        }
        
        UIView.animate(withDuration: 0.5) {
            self.view.layoutSubviews()
        }
    }
    
    @objc func keyboardHide(notification:Notification){
        self.loginViewBottomConstraint.constant = 10
        UIView.animate(withDuration: 0.5) {
            self.view.layoutSubviews()
        }
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    func clearTextField(){
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    @IBAction func buttonBackTapped(_ sender: Any) {
        if #available(iOS 13.0, *) {
            if let navController = self.navigationController {
                navController.popViewController(animated: true)
            }
        }else{
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        loginButton.showLoading()
        if checkTextFields(){
            WebService.shared.login(email: self.userNameTextField.text!, password: self.passwordTextField.text!) { (success, errorMessage, model) in
                DispatchQueue.main.async {
                    self.loginButton.hideLoading()
                    self.loginButton.setTitle("LOGIN", for: .normal)
                    if success{
                        let main_tab =  self.storyboardValue.instantiateViewController(withIdentifier: "HomeTabbarViewController") as! HomeTabbarViewController
                        if #available(iOS 13.0, *) {
                            self.navigationController?.pushViewController(main_tab, animated: false)
                        }else{
                            self.present(main_tab, animated: false, completion: nil)
                        }
                    }else{
                        self.showAlert(message: errorMessage!)
                    }
                }
            }
        }else{
            self.loginButton.hideLoading()
            showAlert(message: LOGIN_INVALIDMESSAGE)
        }
        debugPrint("login Pressed")
        self.clearTextField()
    }
    
    //MainTabbar
    
    @IBAction func buttonForgotPasswordTapped(_ sender: Any) {
        let forgot =  self.storyboardValue.instantiateViewController(withIdentifier: "ForgotPasswordViewController") as! ForgotPasswordViewController
        if #available(iOS 13.0, *) {
            self.navigationController?.pushViewController(forgot, animated: false)
        }else{
            self.present(forgot, animated: false, completion: nil)
        }
    }
    
    func checkTextFields() -> Bool{
        if userNameTextField.text!.isEmpty && passwordTextField.text!.isEmpty{
            return false
        }else{
            return true
        }
    }
    
    func showAlert(message: String){
        let alert = UIAlertController(title: FITNESSAPP_TITLE, message: message, preferredStyle:.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

extension LoginViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField.tag == 0)
        {
            userNameTextField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        }else{
            passwordTextField.resignFirstResponder()
            loginButtonTapped(loginButton)
        }
        return true
    }
}
