//
//  HomeViewController.swift
//  Fitness-App
//
//  Created by Netventure on 27/02/20.
//  Copyright © 2020 freelancer. All rights reserved.
//

import UIKit
import AMTabView

class HomeViewController: UIViewController, TabItem {
    
    @IBOutlet weak var dietListTableView: UITableView!
    var dielList : DietSuccessModel? = nil
    var tabImage: UIImage? {
        return UIImage(named: "home")
    }
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        callDietListApi()
    }
    
    func callDietListApi(){
        WebService.shared.dietListAPI { (success, erroMesssage, model) in
            if success{
                self.dielList = model
//                self.dielList?.data = self.dielList?.data?.reverse()
                self.count = (self.dielList?.data?.count)!
            }else{
                self.dielList = nil
                self.count = 0
            }
            DispatchQueue.main.async {
                self.dietListTableView.reloadData()
            }
        }
    }
}

extension HomeViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count == 0 ? 1 : count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell =  dietPlanTableViewCell()
        if count !=  0{
            if count == indexPath.row{
                let cell = UITableViewCell()
                cell.backgroundColor = .clear
                return cell
            }else{
                cell = tableView.dequeueReusableCell(withIdentifier: "dietPlanTableViewCell0", for: indexPath) as! dietPlanTableViewCell
                cell.dietContentView.layer.cornerRadius = 6.0
                cell.dietContentView.layer.masksToBounds = true
                cell.dietContentView.layer.borderWidth = 0.5
                cell.dietContentView.layer.borderColor = DONE_BUTTON_COLOR.cgColor
                cell.dietTimeLabel.text = "\((self.dielList?.data![indexPath.row].time)!)"
                cell.dietDetailText.text = (self.dielList?.data![indexPath.row].item)!
                return cell
            }

        }else{
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "emptyTableViewCell1", for: indexPath) as! emptyTableViewCell
            return cell1
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if count != 0{
            if count == indexPath.row{
                return 60.0
            }else{
                return UITableView.automaticDimension
            }
            
        }else{
            return tableView.frame.height
        }
    }
    
}
