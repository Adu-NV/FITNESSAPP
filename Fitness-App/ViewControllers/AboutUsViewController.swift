//
//  AboutUsViewController.swift
//  Fitness-App
//
//  Created by Netventure on 15/02/20.
//  Copyright © 2020 freelancer. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController {

    @IBOutlet weak var aboutUsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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

extension AboutUsViewController : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row{
        case 0:
            return 250.0
            case 1:
                return UITableView.automaticDimension
        default:
            return .zero
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = AboutUsTableViewCell()
        switch indexPath.row {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "AboutUsTableViewCell1", for: indexPath) as! AboutUsTableViewCell
            return cell
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: "AboutUsTableViewCell2", for: indexPath) as! AboutUsTableViewCell
            return cell
        default:
            return cell
        }
    }
    
    
}
