//
//  Extension + UIAlert.swift
//  Fitness-App
//
//  Created by Netventure on 09/03/20.
//  Copyright © 2020 freelancer. All rights reserved.
//

import Foundation
import  UIKit
import AZDialogView

extension ViewController{
    func showAlert(message:String,view: UIViewController){
        DispatchQueue.main.async {
            let alert = UIAlertController(title: FITNESSAPP_TITLE, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                case .default:
                    print("default")
                case .cancel:
                    print("cancel")
                case .destructive:
                    print("destructive")
                }
            }))
            view.present(alert, animated: true, completion: nil)
        }
    }

    func dismissAlert() {
        if let viewController  = self.presentedViewController{
            if viewController is AZDialogViewController{
                viewController.dismiss(animated: true)
            }
        }
    }
    
    @discardableResult
    func showAlert(dismissOutSideTouch: Bool = false, title:String,message:String, okButtonTitle:String,okButtonAcion: @escaping (() -> Void)) -> AZDialogViewController {
        return self.showAlert(dismissOutSideTouch: dismissOutSideTouch, image: nil, title: title, message: message, okButtonTitle: okButtonTitle, cancelButtonTitle: nil, okButtonAcion: okButtonAcion, cancelButtonAcion: nil)
    }
    
    func showAlert(title:String,message:String, okButtonTitle:String, cancelButtonTitle:String, okButtonAcion: @escaping (() -> Void) , cancelButtonAcion: @escaping (() -> Void) )  {
        self.showAlert(image: nil, title: title, message: message, okButtonTitle: okButtonTitle, cancelButtonTitle: cancelButtonTitle, okButtonAcion: okButtonAcion, cancelButtonAcion: cancelButtonAcion)
    }
    
    func showAlert(image:UIImage, title:String,message:String, okButtonTitle:String, okButtonAcion: @escaping (() -> Void)  )  {
        self.showAlert(image: image, title: title, message: message, okButtonTitle: okButtonTitle, cancelButtonTitle: nil, okButtonAcion: okButtonAcion, cancelButtonAcion: nil)
    }
    
    func showAlert(dismissOutSideTouch: Bool = true, image:UIImage!, title:String!,message:String!, okButtonTitle:String!, cancelButtonTitle:String!, okButtonAcion: (() -> Void)! , cancelButtonAcion: (() -> Void)! ) -> AZDialogViewController {
        let alert:AZDialogViewController = AZDialogViewController(title:title ,message:message)
        alert.dismissDirection = .bottom
        alert.dismissWithOutsideTouch = dismissOutSideTouch
        alert.showSeparator = false
        alert.separatorColor = UIColor.red
        alert.allowDragGesture = false
        alert.buttonStyle = { (button, height, position) in
            button.layer.cornerRadius = 10
        }
        if image != nil {
            alert.imageHandler = { (imageView) in
                imageView.image = image
                imageView.layer.masksToBounds=true
                imageView.layer.borderWidth=0.5
                imageView.layer.borderColor = UIColor.gray.cgColor
                imageView.contentMode = .scaleAspectFill
                return true
            }
        }
        if okButtonTitle != nil {
            alert.addAction(AZDialogAction(title: okButtonTitle) { (dialog) -> (Void) in
                self.dismiss(animated: true, completion: nil)
                okButtonAcion()
            })
        }
        if cancelButtonTitle != nil {
            alert.addAction(AZDialogAction(title: cancelButtonTitle) { (dialog) -> (Void) in
                self.dismiss(animated: true, completion: nil)
                cancelButtonAcion()
            })
        }
        self.present(alert, animated: true, completion: nil)
        return alert
    }
    
//    func showDefaultAlert(_ textField: UITextField,_ message: String) {
//        self.showDefaultAlert(title:"Warning", textField: textField, message:message)
//    }
    
//    func showDefaultAlert(title: String, textField: UITextField, message: String) {
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
//            (alertAction) in
//            textField.becomeFirstResponder()
//            alert.dismiss(animated: false, completion: nil)
//        }))
//        self.present(alert, animated: true, completion: nil)
//    }
    
}



