//
//  CollectionViewCell + Class.swift
//  Fitness-App
//
//  Created by Netventure on 28/02/20.
//  Copyright © 2020 freelancer. All rights reserved.
//

import Foundation
import UIKit

class workoutCollectionViewCell : UICollectionViewCell{
    @IBOutlet weak var workotNameLabel: UILabel!
    @IBOutlet weak var workoutCountLabel: UILabel!
    @IBOutlet weak var workoutSetLabel: UILabel!
    @IBOutlet weak var workoutRestTimeLabel: UILabel!
    override func awakeFromNib() {
//        code here
    }
    
}

class emptyCollectionViewCell : UICollectionViewCell{
    override func awakeFromNib() {
        //        code here
    }
}
