//
//  TableViewCells + Class + Extension.swift
//  Fitness-App
//
//  Created by Netventure on 28/02/20.
//  Copyright © 2020 freelancer. All rights reserved.
//

import Foundation
import UIKit
import YoutubePlayer_in_WKWebView


//MARK:- Workout
class workoutTableViewCell : UITableViewCell{
    
    @IBOutlet weak var workotNameLabel: UILabel!
    @IBOutlet weak var workoutCountLabel: UILabel!
    @IBOutlet weak var workoutSetLabel: UILabel!
    @IBOutlet weak var workoutRestTimeLabel: UILabel!
    @IBOutlet weak var workoutView: UIView!
    @IBOutlet weak var workoutSwipeView: UIView!
    
    override func awakeFromNib(){
    }
}

//MARK:- Empty
class emptyTableViewCell : UITableViewCell{
    override func awakeFromNib(){
    }
}

//MARK:- Workout Detail
class workOutDetailsTableViewCell : UITableViewCell{
    
     @IBOutlet weak var workOutDetailView: WKYTPlayerView!
    @IBOutlet weak var workOutNameLabel: UILabel!
    @IBOutlet weak var workOutMuscleNameLabel: UILabel!
    @IBOutlet weak var workOutDurationLabel: UILabel!
    @IBOutlet weak var workOutSetLabel: UILabel!
    @IBOutlet weak var workOutRestLabel: UILabel!
    @IBOutlet weak var workOutDescriptionLabel: UILabel!
    
    override func awakeFromNib(){
            // code here
    }
}
//MARK:- PurchaseList

class purchaseListTableViewCell : UITableViewCell{
    @IBOutlet weak var activePackageView: UIView!
    @IBOutlet weak var activePackageName: UILabel!
    @IBOutlet weak var activePackageDescription: UILabel!
    @IBOutlet weak var activePackagePrice: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var validitylabel: UILabel!
    
    @IBOutlet weak var purchaseListView: UIView!
    @IBOutlet weak var packageNameLabel: UILabel!
    @IBOutlet weak var packageDescriptionLabel: UILabel!
    @IBOutlet weak var packagePriceLabel: UILabel!
    @IBOutlet weak var packageValidityLabel: UILabel!
    @IBOutlet weak var buyButtonTapped: UIButton!
    
    override func awakeFromNib(){
        if let _ = activePackageView{
            activePackageView.layer.cornerRadius = 10.0
            activePackageView.layer.masksToBounds = true
        }
        if let _ = purchaseListView{
            purchaseListView.layer.cornerRadius = 10.0
            purchaseListView.layer.masksToBounds = true
        }
        if let _ = buyButtonTapped{
            buyButtonTapped.layer.cornerRadius = 5.0
            buyButtonTapped.layer.masksToBounds = true
        }
    }
    
    @IBAction func buyButtonclicked(_ sender: Any){
        debugPrint("Buy ButtonTapped")
    }
}

//MARK:- PurchaseHistory
class purchaseHistoryTableViewCell : UITableViewCell{
    
    @IBOutlet weak var purchasedDateLabel: UILabel!
    @IBOutlet weak var purchasePlanNameLabel: UILabel!
    @IBOutlet weak var purchasePriceLabel: UILabel!
    @IBOutlet weak var purchaseEndLabel: UILabel!
    @IBOutlet weak var purchasestartDateLabel: UILabel!
    @IBOutlet weak var purchaseTypeLabel: UILabel!
    @IBOutlet weak var purchaseIDLabel: UILabel!
    @IBOutlet weak var purchaseHistoryView: UIView!
    override func awakeFromNib(){
        if let _ = purchaseHistoryView{
            purchaseHistoryView.layer.cornerRadius = 6.0
            purchaseHistoryView.layer.masksToBounds = true
        }
    }
}

//MARK:- DietPlan
class dietPlanTableViewCell : UITableViewCell{
    @IBOutlet weak var dietContentView: UIView!
    @IBOutlet weak var dietTimeLabel: UILabel!
    @IBOutlet weak var dietDetailText: UILabel!
    override func awakeFromNib() {
            // code here
    }
}

//MARK:- Profile
class profile_TableViewCell : UITableViewCell{
    @IBOutlet weak var goalsLabel: UILabel!
    @IBOutlet weak var reviewDateLabel: UILabel!
    @IBOutlet weak var joiningDateLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var mobileNumberLabel: UILabel!
    @IBOutlet weak var mailIDLabel: UILabel!
    override func awakeFromNib() {
        // code here
    }
    @IBAction func buttonPackageTapped(_ sender: Any){
        var  view = UIViewController()
        view =  (((self.superview as? UITableView)?.delegate as? UIViewController)!)
         let storyboardValue = UIStoryboard.init(name: "Main", bundle: nil)
        let package =  storyboardValue.instantiateViewController(withIdentifier: "PackageViewController") as! PackageViewController
        if #available(iOS 13.0, *) {
            view.navigationController?.pushViewController(package, animated: false)
        }else{
            view.present(package, animated: false, completion: nil)
        }
    }
}


//MARK:- Package Detail

class packageDetailTableViewCell: UITableViewCell{
    @IBOutlet weak var packageNameLabel: UILabel!
    @IBOutlet weak var packageDescriptionLabel: UILabel!
    @IBOutlet weak var muscleNameLabel: UILabel!
    @IBOutlet weak var validityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    override func awakeFromNib() {
        
    }
    @IBAction func buyButtonTapped(_ sender: Any) {
    }
}

