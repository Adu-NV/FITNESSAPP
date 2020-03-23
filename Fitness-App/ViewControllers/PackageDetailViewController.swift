//
//  PackageDetailViewController.swift
//  Fitness-App
//
//  Created by Netventure on 16/03/20.
//  Copyright © 2020 freelancer. All rights reserved.
//

import UIKit
import PlugNPlay

class PackageDetailViewController: UIViewController {
    var packageDetailModel : PackageDetailListModel? = nil
    var packageId  = ""
    var txnParams = PUMTxnParam()
    var dictionary = Dictionary<String,String>()
    @IBOutlet weak var packageDetailTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.getPackageDetails()
    }
    
    func getPackageDetails(){
        WebService.shared.packageDetailsAPI(id: packageId) { (success, errorMessage, model) in
            if success{
                self.packageDetailModel = model
            }else{
                self.packageDetailModel = nil
            }
            DispatchQueue.main.async {
                self.packageDetailTableView.reloadData()
            }
        }
    }
    
    @IBAction func backButtontapped(_ sender: Any) {
        if #available(iOS 13.0, *) {
            if let navController = self.navigationController {
                navController.popViewController(animated: true)
            }
        }else{
            self.dismiss(animated: false, completion: nil)
        }
    }
    @IBAction func buyButtonTapped(_ sender: Any) {
        txnParams.environment = PUMEnvironment.test
        txnParams.surl = "https://www.payumoney.com/mobileapp/payumoney/success.php"
        txnParams.furl = "https://www.payumoney.com/mobileapp/payumoney/failure.php"
        txnParams.amount = self.packageDetailModel?.data!.package_fee
        txnParams.key = MERCHANT_KEY
        txnParams.merchantid = "5535161"
        txnParams.txnID = TRANSACTION_ID + "\(DateFunction().getDate())"
        txnParams.firstname = ""//self.btnProfile.currentTitle?.trimmingCharacters(in: .whitespaces)
        txnParams.productInfo = PRODUCT_NAME
        txnParams.email = UserDefaults.standard.value(forKey: "email") as! String//"kcadarsh18@gmail.com"//self.membership.paymentInfo?.email                UserDefaults.standard.set((self.profileModel?.data?.email)!, forKey: "email")
        txnParams.phone = UserDefaults.standard.value(forKey: "mobile") as! String//"+919544359699"//self.membership.paymentInfo?.phoneUserDefaults.standard.set((self.profileModel?.data?.phone)!, forKey: "mobile")
        txnParams.udf1 = ""
        txnParams.udf2 = ""
        txnParams.udf3 = ""
        txnParams.udf4 = ""
        txnParams.udf5 = ""
        txnParams.udf6 = ""
        txnParams.udf7 = ""
        txnParams.udf8 = ""
        txnParams.udf9 = ""
        txnParams.udf10 = ""
        PlugNPlay.setTopBarColor(UIColor.black)
        PlugNPlay.setButtonColor(UIColor.red)
        PlugNPlay.setButtonTextColor(UIColor.white)
        PlugNPlay.setTopTitleTextColor(UIColor.white)
        
        PlugNPlay.setDisableCompletionScreen(true)
        PlugNPlay.setExitAlertOnBankPageDisabled(true)
        PlugNPlay.setExitAlertOnCheckoutPageDisabled(true)
        PlugNPlay.setMerchantDisplayName(PRODUCT_NAME)
        generateHashParameterAPI(key: txnParams.key, txnID: txnParams.txnID, amount: txnParams.amount, productInfo: txnParams.productInfo, firstname: txnParams.firstname, email: txnParams.email, udf1: txnParams.udf1, udf2: txnParams.udf2, udf3: txnParams.udf3, udf4: txnParams.udf4,  udf5: txnParams.udf5, udf6: txnParams.udf6, udf7: txnParams.udf7, udf8: txnParams.udf8, udf9: txnParams.udf9,  udf10: txnParams.udf10, salt: MERCHANT_SALT)
        //makePaymentAPI(transactionId: "1232342")
    }
    
    func generateHashParameterAPI(key: String, txnID: String, amount: String, productInfo: String, firstname: String, email: String, udf1: String, udf2: String, udf3: String, udf4: String,  udf5: String, udf6: String, udf7: String, udf8: String, udf9: String,  udf10:String, salt: String){
        let hashSequence = "\(key)|\(txnID)|\(amount)|\(productInfo)|\(firstname)|\(email)|\(udf1)|\(udf2)|\(udf3)|\(udf4)|\(udf5)||||||\(salt)"
        var body = Dictionary<String,String>()
        body["hashSequence"] = hashSequence
        WebService.shared.generatehash(body: body) { (success, error, model) in
            if success{
                self.txnParams.hashValue = (model?.data?.hash)!
                DispatchQueue.main.async {
                    PlugNPlay.presentPaymentViewController(withTxnParams: self.txnParams, on: self) { (message, error, str) in
                        debugPrint("message : \(message), error : \(error), str : \(str) ")
                        
                        if let resullt = (message  as! Dictionary<String,Any>)["result"]{
                            if (resullt as! Dictionary<String,Any>)["postUrl"] as! String == SUCCESS_URL{
                                self.success(txnid: (resullt as! Dictionary<String,Any>)["txnid"] as! String, amount: (resullt as! Dictionary<String,Any>)["amount"] as! String, paid_on: "\((resullt as! Dictionary<String,Any>)["createdOn"] as! NSNumber)", paymentid: "\((resullt as! Dictionary<String,Any>)["paymentId"] as! NSNumber)")
                            }else{
                                self.failed(txnid: (resullt as! Dictionary<String,Any>)["txnid"] as! String, amount: (resullt as! Dictionary<String,Any>)["amount"] as! String, paid_on: "\((resullt as! Dictionary<String,Any>)["createdOn"] as! NSNumber)", paymentid: "\((resullt as! Dictionary<String,Any>)["paymentId"] as! NSNumber)")
                            }
                        }
                    }
                }
            }else{
                debugPrint("can not hash")
            }
        }
    }
    /*
     transaction_id,payment_id,amount,paid_on, package_id, start_date
     */
    func success(txnid : String,amount : String,paid_on : String,paymentid : String){
        showAlert(message: "Payment success", boolValue: true)
        let dateString = Date().convertDate(timestamp: paid_on)
        
        dictionary["transaction_id"] = txnid
        dictionary["amount"] = amount
        dictionary["paid_on"] = dateString
        dictionary["payment_id"] = paymentid
        dictionary["package_id"] = packageId
        dictionary["start_date"] = Date().getCurrentShortDate()
//        successAPICall()
    }
    
    func failed(txnid : String,amount : String,paid_on : String,paymentid : String){
        showAlert(message: "Payment failure", boolValue: false)
        let dateString = Date().convertDate(timestamp: paid_on)
        
        dictionary["transaction_id"] = txnid
        dictionary["amount"] = amount
        dictionary["paid_on"] = dateString
        dictionary["payment_id"] = paymentid
//        failureAPICall()
    }
    
    func successAPICall(){
        WebService.shared.successResponse(body: dictionary) { (success, error, model) in
            debugPrint(model)
            if success{
                
            }
        }
    }
    
    func failureAPICall(){
        WebService.shared.failureResponse(body: dictionary) { (success, error, model) in
            debugPrint(model)
            if success{
                
            }
        }
    }
    
    func showAlert(message: String, boolValue : Bool){
        debugPrint("alert")
        let alert = UIAlertController(title: FITNESSAPP_TITLE, message: message, preferredStyle:.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            boolValue != true ? self.failureAPICall() : self.successAPICall()
        }))
        self.present(alert, animated: true, completion: nil)
        }
}

extension PackageDetailViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell =  packageDetailTableViewCell()
        switch  indexPath.row{
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "packageDetailTableViewCell0", for: indexPath) as! packageDetailTableViewCell
            cell.packageNameLabel.text = packageDetailModel != nil ? (packageDetailModel?.data?.package_name)! : "Package Name"
            return cell
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: "packageDetailTableViewCell1", for: indexPath) as! packageDetailTableViewCell
            cell.packageDescriptionLabel.text = packageDetailModel != nil ? (packageDetailModel?.data?.package_desc)! : "Package Description"
            return cell
            //        case 2:
            //            cell = tableView.dequeueReusableCell(withIdentifier: "packageDetailTableViewCell2", for: indexPath) as! packageDetailTableViewCell
            //            cell.muscleNameLabel.text = "Package muscle name"// packageDetailModel != nil ? (packageDetailModel?.data?.)! : "Package Name"
        //            return cell
        case 2:
            cell = tableView.dequeueReusableCell(withIdentifier: "packageDetailTableViewCell3", for: indexPath) as! packageDetailTableViewCell
            cell.validityLabel.text = packageDetailModel != nil ? "\((packageDetailModel?.data?.package_validity)!)": "Package Validity"
            return cell
        case 3:
            cell = tableView.dequeueReusableCell(withIdentifier: "packageDetailTableViewCell4", for: indexPath) as! packageDetailTableViewCell
            cell.priceLabel.text = packageDetailModel != nil ? (packageDetailModel?.data?.package_fee)! : "Package Price"
            return cell
        default:
            cell = tableView.dequeueReusableCell(withIdentifier: "packageDetailTableViewCell5", for: indexPath) as! packageDetailTableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
