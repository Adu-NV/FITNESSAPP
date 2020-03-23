//
//  CheckBMIViewController.swift
//  Fitness-App
//
//  Created by Netventure on 16/02/20.
//  Copyright © 2020 freelancer. All rights reserved.
//

import UIKit
import ABGaugeViewKit

class CheckBMIViewController: UIViewController {

    @IBOutlet weak var constraintCenterLayout: NSLayoutConstraint!
    @IBOutlet weak var bmiValueView: ABGaugeView!
    @IBOutlet weak var bmiValueLabel: UILabel!
    @IBOutlet weak var bmiObserVationLabel: UILabel!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiValueView.needleValue = 0.0  * 2.5
        calculateButton.setCornerRadius(radius: 10.0)
        bmiValueLabel.text = "\(bmiValueView.needleValue / 2.5)"
        bmiObserVationLabel.text = "Under Weight"
    }
    override func viewWillAppear(_ animated: Bool) {
          NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardHide(notification:)), name:UIResponder.keyboardWillHideNotification, object: nil)
              NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardShow(notification:)), name:UIResponder.keyboardWillShowNotification, object: nil)
              let _tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
              self.view.addGestureRecognizer(_tap)
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
    
    @IBAction func calculateButtonTapped(_ sender: Any) {
        if heightTextField.text!.isEmpty || weightTextField.text!.isEmpty{
            
        }else if !(heightTextField.text!.isEmpty && weightTextField.text!.isEmpty) {
            let height = (heightTextField.text! as NSString).floatValue / 100
            var value = (weightTextField.text! as NSString).floatValue / (height * height)
            if value > 40 {
                value = 40
            }
            bmiValueView.needleValue = CGFloat((value * 2.5))
            bmiValueLabel.text = String(format: "%.2f  kg/m2", value)// "0.2f\(value)"
            bmiObserVationLabel.text = calulateBMIValue(value: value)
            
        }
        
    }
    
    func calulateBMIValue(value : Float) -> String{
        if value < 18.5{
            return "Under Weight"
        }else if value > 18.5 && value < 25.0{
            return "Normal Weight"
        }else if value > 24.9 && value < 29{
            return "Over Weight"
        }else{
            return "Obese Weight"
        }
        
    }
    
    @objc func keyboardShow(notification:Notification){
        self.constraintCenterLayout.constant = -70
        UIView.animate(withDuration: 0.5) {
            self.view.layoutSubviews()
        }
    }
    
    @objc func keyboardHide(notification:Notification){
        self.constraintCenterLayout.constant = 0
        UIView.animate(withDuration: 0.5) {
            self.view.layoutSubviews()
        }
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}
