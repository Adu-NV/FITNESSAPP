//
//  WorkOutDetailViewController.swift
//  Fitness-App
//
//  Created by Netventure on 05/03/20.
//  Copyright © 2020 freelancer. All rights reserved.
//

import UIKit

class WorkOutDetailViewController: UIViewController {

    var muscleText = ""
    var set = ""
    var restTime = ""
    var repeatation = ""
    var body : Dictionary<String,String>? = nil
    var workOutDetailModel : WorkoutDetailModel? = nil
    @IBOutlet weak var workOutDetailTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // code here
        getWorkOutDetails()
    }
    
    func getWorkOutDetails(){
        WebService.shared.workOutDetails(body: body!) { (success, errorMessage, model) in
            if success{
                self.workOutDetailModel = model
            }else{
                self.workOutDetailModel = nil
            }
            DispatchQueue.main.async {
                self.workOutDetailTableView.reloadData()
            }
        }
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
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        debugPrint("done button Tapped")
    }
}

extension WorkOutDetailViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = workOutDetailsTableViewCell()
        muscleText.removeAll()
        switch indexPath.row{
        case 0:
            cell =  tableView.dequeueReusableCell(withIdentifier: "workOutDetailsTableViewCell1", for: indexPath) as! workOutDetailsTableViewCell
            let value = self.workOutDetailModel != nil ? (self.workOutDetailModel?.data?.workout_video_code)! : ""
            
            cell.workOutDetailView.load(withVideoId:value )
//            cell.
            return cell
        case 1:
            cell =  tableView.dequeueReusableCell(withIdentifier: "workOutDetailsTableViewCell2", for: indexPath) as! workOutDetailsTableViewCell
            if self.workOutDetailModel != nil{
                for i in 0 ..< (self.workOutDetailModel?.data?.workout_muscles?.count)!{
                    muscleText.append((self.workOutDetailModel?.data?.workout_muscles![i].muscle_name)!)
                    muscleText.append( "\n")
                }
            }
            cell.workOutMuscleNameLabel.text = muscleText
            return cell
        case 2:
            cell =  tableView.dequeueReusableCell(withIdentifier: "workOutDetailsTableViewCell3", for: indexPath) as! workOutDetailsTableViewCell
            if self.workOutDetailModel != nil{
                self.repeatation = self.workOutDetailModel?.data?.workout_is_time == 0 ?  "\((self.workOutDetailModel?.data?.workout_repetition)!) Count" : "\((self.workOutDetailModel?.data?.workout_repetition)! / 60) Minutes"
                self.restTime = (self.workOutDetailModel?.data?.workout_rest)! < 60 ? "\((self.workOutDetailModel?.data?.workout_rest)!) Seconds"  : "Rest time : \(((self.workOutDetailModel?.data?.workout_rest)! / 60)) Minutes"
                
            }
            cell.workOutDurationLabel.text = self.repeatation
            cell.workOutSetLabel.text = self.workOutDetailModel != nil ? " X \((self.workOutDetailModel?.data?.workout_set)!) Sets" : ""
            cell.workOutRestLabel.text = self.restTime
            return cell
        default:
            cell =  tableView.dequeueReusableCell(withIdentifier: "workOutDetailsTableViewCell4", for: indexPath) as! workOutDetailsTableViewCell
            cell.workOutDescriptionLabel.text = self.workOutDetailModel != nil ? (self.workOutDetailModel?.data?.workout_desc)! : ""
            return cell
//        default:
//            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 250.0//UITableView.automaticDimension
        }else{
           return UITableView.automaticDimension
        }
        
    }
    
    
}
