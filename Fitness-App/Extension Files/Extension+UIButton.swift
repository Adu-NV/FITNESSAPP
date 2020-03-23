//
//  Extension+UIButton.swift
//  Fitness-App
//
//  Created by Netventure on 15/02/20.
//  Copyright © 2020 freelancer. All rights reserved.
//

import Foundation
import UIKit

extension UIButton{
    func setCornerRadius(radius:CGFloat){
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}
