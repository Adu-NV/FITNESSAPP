//
//  ViewController.swift
//  Fitness-App
//
//  Created by Netventure on 14/02/20.
//  Copyright © 2020 freelancer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var homeTableView: UITableView!
    let storyboardValue = UIStoryboard.init(name: "Main", bundle: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.homeTableView.reloadData()
    }
}
//MARK:- TableView Delegate and DataSource
extension ViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return tableView.frame.height / 4
        case 1:
            return 120.0
        case 2,3,4,5:
            return 180.0
        default:
            return 0.0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = HomeTableViewCell()
        switch indexPath.row {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell1", for: indexPath) as! HomeTableViewCell
            return cell
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell2", for: indexPath) as! HomeTableViewCell
            cell.upArroowImage.loadGif(name: "up_arrow1")
            return cell
        case 2:
            
            cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell3", for: indexPath) as! HomeTableViewCell
            return cell
        case 3:
            if  let _ = UserDefaults.standard.value(forKey: "logged"){
                if UserDefaults.standard.value(forKey: "logged") as! Bool{
//                    https://www.youtube.com/watch?v=8rywfp_i11U
                    cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell4", for: indexPath) as! HomeTableViewCell
                    return cell
                }else{
                    cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell5", for: indexPath) as! HomeTableViewCell
                    return cell
                }
            }else{
                cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell5", for: indexPath) as! HomeTableViewCell
                return cell
            }
            
            
            
        case 4:
            cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell6", for: indexPath) as! HomeTableViewCell
            return cell
        default:
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 2{
            let check_BMI =  storyboardValue.instantiateViewController(withIdentifier: "CheckBMIViewController") as! CheckBMIViewController
            if #available(iOS 13.0, *) {
                self.navigationController?.pushViewController(check_BMI, animated: false)
            }else{
                self.present(check_BMI, animated: false, completion: nil)
            }
            
        }
        if indexPath.row == 3{
            let login =  storyboardValue.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
             let main_tab =  self.storyboardValue.instantiateViewController(withIdentifier: "HomeTabbarViewController") as! HomeTabbarViewController
            if  let _ = UserDefaults.standard.value(forKey: "logged"){
                if UserDefaults.standard.value(forKey: "logged") as! Bool{
                    if #available(iOS 13.0, *) {
                        self.navigationController?.pushViewController(main_tab, animated: false)
                    }else{
                        self.present(main_tab, animated: false, completion: nil)
                    }
                }else{
                    if #available(iOS 13.0, *) {
                        self.navigationController?.pushViewController(login, animated: false)
                    }else{
                        self.present(login, animated: false, completion: nil)
                    }
                }
            }else{
                if #available(iOS 13.0, *) {
                    self.navigationController?.pushViewController(login, animated: false)
                }else{
                    self.present(login, animated: false, completion: nil)
                }
            }
          }
        if indexPath.row == 4{
            let about =  storyboardValue.instantiateViewController(withIdentifier: "AboutUsViewController") as! AboutUsViewController
            if #available(iOS 13.0, *) {
                self.navigationController?.pushViewController(about, animated: false)
            }else{
                self.present(about, animated: false, completion: nil)
            }
        }
    }
}



