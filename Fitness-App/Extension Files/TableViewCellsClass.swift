//
//  TableViewCellsClass.swift
//  Fitness-App
//
//  Created by Netventure on 15/02/20.
//  Copyright © 2020 freelancer. All rights reserved.
//

import Foundation
import UIKit

//MARK:-  Home page
class HomeTableViewCell : UITableViewCell{
    @IBOutlet weak var homeContentView: UIView!
    @IBOutlet weak var upArroowImage: UIImageView!
    
    override func awakeFromNib() {
        if let _ = homeContentView{
            homeContentView.layer.cornerRadius = 12.0
            homeContentView.layer.masksToBounds =  true
        }
    }
}

//MARK:-  About Us page
class AboutUsTableViewCell : UITableViewCell{
    
}
