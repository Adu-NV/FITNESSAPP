//
//  PackageHistoryViewController.swift
//  Fitness-App
//
//  Created by Netventure on 05/03/20.
//  Copyright © 2020 freelancer. All rights reserved.
//

import UIKit

class PackageHistoryViewController: UIViewController {

    @IBOutlet weak var paymentTableView: UITableView!
    var paymentModel : TranscationHistoryModel? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getPaymentHistory()
    }
    
    func getPaymentHistory(){
        WebService.shared.paymentHistoryListAPI { (success, errorMessage, model) in
            if success{
                self.paymentModel = model
            }else{
                self.paymentModel = nil
            }
            DispatchQueue.main.async {
                self.paymentTableView.reloadData()
            }
        }
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

extension PackageHistoryViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.paymentModel != nil ? (self.paymentModel?.data?.count)! :  1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = purchaseHistoryTableViewCell()
        if self.paymentModel != nil{
            cell = tableView.dequeueReusableCell(withIdentifier: "purchaseHistoryTableViewCell", for: indexPath) as! purchaseHistoryTableViewCell
            cell.purchasedDateLabel.text = (self.paymentModel?.data![indexPath.row].purchase_date)!
            cell.purchasePlanNameLabel.text = (self.paymentModel?.data![indexPath.row].package)!
            cell.purchasePriceLabel.text = "Rs. " + (self.paymentModel?.data![indexPath.row].amount)!
            cell.purchasestartDateLabel.text = (self.paymentModel?.data![indexPath.row].start_date)!
            cell.purchaseEndLabel.text = (self.paymentModel?.data![indexPath.row].end_date)!
            cell.purchaseTypeLabel.text = (self.paymentModel?.data![indexPath.row].payment_type)!
            cell.purchaseIDLabel.text = (self.paymentModel?.data![indexPath.row].payment_id)!
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "emptyTableViewCell3", for: indexPath) as! emptyTableViewCell
            return cell
        }

        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         if self.paymentModel != nil{
             return UITableView.automaticDimension
         }else{
            return tableView.frame.height
        }
       
    }
    
    
}
