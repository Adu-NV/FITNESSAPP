//
//  PackageViewController.swift
//  Fitness-App
//
//  Created by Netventure on 05/03/20.
//  Copyright © 2020 freelancer. All rights reserved.
//

import UIKit
import PlugNPlay

class PackageViewController: UIViewController {
 let storyboardValue = UIStoryboard.init(name: "Main", bundle: nil)
    @IBOutlet weak var purchaseListTableView: UITableView!
    var packeListModel : PackageListModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        purchaseListTableView.estimatedRowHeight = 200
        
//        purchaseListTableView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        packageListAPI()
    }
    
    func packageListAPI(){
        WebService.shared.packageListAPI { (success, errorMessage, model) in
            if success{
                self.packeListModel = model
            }else{
                self.packeListModel = nil
            }
            DispatchQueue.main.async {
                self.purchaseListTableView.reloadData()
            }
        }
    }
    
    @IBAction func purchaseHistoryButtonTapped(_ sender: UIButton) {
        let main_tab =  self.storyboardValue.instantiateViewController(withIdentifier: "PackageHistoryViewController") as! PackageHistoryViewController
        if #available(iOS 13.0, *) {
            self.navigationController?.pushViewController(main_tab, animated: false)
        }else{
            self.present(main_tab, animated: false, completion: nil)
        }
        debugPrint("purchase button tapped")
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        if #available(iOS 13.0, *) {
            if let navController = self.navigationController {
                navController.popViewController(animated: true)
            }
        }else{
            self.dismiss(animated: false, completion: nil)
        }
    }
}

extension PackageViewController : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  self.packeListModel != nil ? (self.packeListModel?.data?.packages?.count)! : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = purchaseListTableViewCell()
        if self.packeListModel != nil{
            
            switch indexPath.row {
            case 0:
                if self.packeListModel?.data?.active != nil{
                    cell = tableView.dequeueReusableCell(withIdentifier: "purchaseListTableViewCell1", for: indexPath) as! purchaseListTableViewCell
                    cell.activePackageName.text = (self.packeListModel?.data?.active?.package_name)!
                    cell.activePackageDescription.text = (self.packeListModel?.data?.active?.package_desc)!
                    cell.activePackagePrice.text = "Rs. " +  (self.packeListModel?.data?.active?.package_amount)!
                    cell.startDateLabel.text = "Start Date : " + (self.packeListModel?.data?.active?.package_start_date)!
                    cell.endDateLabel.text = "End Date : " + (self.packeListModel?.data?.active?.package_end_date)!
                    cell.validitylabel.text = "Validity : \((self.packeListModel?.data?.active?.package_validity)!) Months"
                    return cell
                }else{
                    cell = tableView.dequeueReusableCell(withIdentifier: "purchaseListTableViewCell2", for: indexPath) as! purchaseListTableViewCell
                    return cell
                }
            case 1:
                 if self.packeListModel?.data?.active != nil{
                cell = tableView.dequeueReusableCell(withIdentifier: "purchaseListTableViewCell2", for: indexPath) as! purchaseListTableViewCell
                return cell
                 }else{
                    cell = tableView.dequeueReusableCell(withIdentifier: "purchaseListTableViewCell3", for: indexPath) as! purchaseListTableViewCell
                    cell.packageNameLabel.text = (self.packeListModel?.data?.packages![indexPath.row].package_name)!
                     cell.packageDescriptionLabel.text = (self.packeListModel?.data?.packages![indexPath.row].package_desc)!
                     cell.packagePriceLabel.text = "Rs. " +  (self.packeListModel?.data?.packages![indexPath.row].package_amount)!
                     cell.packageValidityLabel.text = "Validity : \((self.packeListModel?.data?.packages![indexPath.row].package_validity)!) Months"
                    return cell
                }
            default:
                if  (self.packeListModel?.data?.packages?.count)! != indexPath.row{
                    cell = tableView.dequeueReusableCell(withIdentifier: "purchaseListTableViewCell3", for: indexPath) as! purchaseListTableViewCell
                    cell.packageNameLabel.text = (self.packeListModel?.data?.packages![indexPath.row].package_name)!
                     cell.packageDescriptionLabel.text = (self.packeListModel?.data?.packages![indexPath.row].package_desc)!
                     cell.packagePriceLabel.text = "Rs. " +  (self.packeListModel?.data?.packages![indexPath.row].package_amount)!
                     cell.packageValidityLabel.text = "Validity : \((self.packeListModel?.data?.packages![indexPath.row].package_validity)!) Months"
                    return cell
                }else{
                    let cell = UITableViewCell()
                    cell.backgroundColor = .clear
                    return cell
                }
             }
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "emptyTableViewCell2", for: indexPath) as! emptyTableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.packeListModel != nil{
            let package =  storyboardValue.instantiateViewController(withIdentifier: "PackageDetailViewController") as! PackageDetailViewController
            package.packageId =  (self.packeListModel?.data?.packages![indexPath.row].package_id)!
            if #available(iOS 13.0, *) {
                self.navigationController?.pushViewController(package, animated: false)
            }else{
                self.present(package, animated: false, completion: nil)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.packeListModel != nil{
            if self.packeListModel?.data?.active != nil{
                if indexPath.row == 1{
                    return UITableView.automaticDimension
                }
            }else{
                if indexPath.row == 0{
                    return UITableView.automaticDimension
                }
            }
            return UITableView.automaticDimension
        }else{
            return tableView.frame.height
        }
       
    }
}
