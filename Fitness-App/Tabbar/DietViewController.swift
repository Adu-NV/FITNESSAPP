//
//  DietViewController.swift
//  Fitness-App
//
//  Created by Netventure on 27/02/20.
//  Copyright © 2020 freelancer. All rights reserved.
//

import UIKit
import AMTabView
class DietViewController: UIViewController, TabItem {
    var workOutModel : WorkoutListModel? = nil
    let storyboardValue = UIStoryboard.init(name: "Main", bundle: nil)
    var bodyDictionary: Dictionary<String,String>? = nil
    var count  = 0
    @IBOutlet weak var workoutTableView: UITableView!
        @IBOutlet weak var workoutDay: UILabel!
    var tabImage: UIImage? {
        return UIImage(named: "nutrition")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        workoutTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        callWorkoutListApi()
    }
    
    func callWorkoutListApi(){
        WebService.shared.workOutListApi { (success, errorMessage, model) in
            if success{
                self.workOutModel = model
                self.count = (self.workOutModel?.data?.workout_list?.count)!
            }else{
                self.count = 0
                self.workOutModel = nil
            }
            DispatchQueue.main.async {
                self.workoutDay.text = self.workOutModel != nil ? "Day :  \((self.workOutModel?.data?.workout_day)!)" : "Day :  1"
                self.workoutTableView.reloadData()
            }
        }
    }
}

extension DietViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.workOutModel != nil{
            return (self.workOutModel?.data?.workout_count!)! + 1
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let _ = self.workOutModel,(self.workOutModel?.data?.workout_count!)! != 0{
            if (self.workOutModel?.data?.workout_count!)! == indexPath.row{
                return UITableViewCell()
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "workoutTableViewCell", for: indexPath) as! workoutTableViewCell
                cell.workoutView.layer.cornerRadius = 6.0
                cell.workoutView.layer.masksToBounds = true
                cell.workoutSwipeView.backgroundColor = (self.workOutModel?.data?.workout_list![indexPath.row].workout_done!)! ? SWIPE_GRAY_COLOR : SWIPE_GREEN_COLOR
                cell.workotNameLabel.text = self.workOutModel?.data?.workout_list![indexPath.row].workout_name
                cell.workoutCountLabel.text = self.workOutModel?.data?.workout_list![indexPath.row].workout_is_time! == 0 ? "\((self.workOutModel?.data?.workout_list![indexPath.row].workout_repetition)!) Count" : "\((self.workOutModel?.data?.workout_list![indexPath.row].workout_repetition)! / 60) Minutes"
                cell.workoutSetLabel.text = "X \((self.workOutModel?.data?.workout_list![indexPath.row].workout_set)!) Sets"
                cell.workoutRestTimeLabel.text = (self.workOutModel?.data?.workout_list![indexPath.row].workout_rest)! < 60 ? "Rest time : \((self.workOutModel?.data?.workout_list![indexPath.row].workout_rest)!) Seconds"  : "Rest time : \(((self.workOutModel?.data?.workout_list![indexPath.row].workout_rest)! / 60)) Minutes"
                return cell
            }
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "emptyTableViewCell", for: indexPath) as! emptyTableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.workOutModel != nil{
            if (self.workOutModel?.data?.workout_count!)! == indexPath.row{
                return .zero
            }
            return UITableView.automaticDimension
        }else{
            return tableView.frame.height
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        debugPrint(indexPath.row)
        bodyDictionary = Dictionary<String,String>()
        //workout_id, workout_schedule_id,day
        if count != 0{
            bodyDictionary!["workout_id"] =  (self.workOutModel?.data?.workout_list![indexPath.row].workout_id)!
            bodyDictionary!["workout_schedule_id"] =  (self.workOutModel?.data?.workout_schedule_id)!
            bodyDictionary!["day"] =  "\((self.workOutModel?.data?.workout_day)!)"
            
            let work =  storyboardValue.instantiateViewController(withIdentifier: "WorkOutDetailViewController") as! WorkOutDetailViewController
            work.body = bodyDictionary
            if #available(iOS 13.0, *) {
                self.navigationController?.pushViewController(work, animated: false)
            }else{
                self.present(work, animated: false, completion: nil)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
         if count != 0{
            if (self.workOutModel?.data?.workout_count!)! == indexPath.row  ||  (self.workOutModel?.data?.workout_list![indexPath.row].workout_done)!{
                       return false
            }else{
                return true
            }
        }
       return true
    }
    
//    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        let more = UITableViewRowAction(style: .default, title: "") { action, index in
//            print("more button tapped \(indexPath.row)")
//            self.doneTapped(index: indexPath.row)
//        }
//        let most = UITableViewRowAction()
//        more.backgroundColor = .clear
//        return [ more]
//    }
    
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//
//            let action =  UIContextualAction(style: .normal, title: "", handler: { (action,view,completionHandler ) in
//                //do stuff
//                print("more button tapped \(indexPath.row)")
//                self.doneTapped(index: indexPath.row)
//                completionHandler(true)
//            })
//        action.image = UIImage(named: "strong.png")
//        action.backgroundColor = .red
//        let configuration = UISwipeActionsConfiguration(actions: [action])
//
//        return configuration
//    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
                    let action =  UIContextualAction(style: .normal, title: "", handler: { (action,view,completionHandler ) in
                //do stuff
                print("more button tapped \(indexPath.row)")
                self.doneTapped(index: indexPath.row)
                completionHandler(true)
            })
        action.image = UIImage(named: "strong.png")
        action.backgroundColor = .red
        let configuration = UISwipeActionsConfiguration(actions: [action])

        return configuration
    }
    
    
    func doneTapped(index: Int){
        //body( workout_id, workout_schedule_id, day)
        let Body = ["workout_id":(self.workOutModel?.data?.workout_list![index].workout_id)! , "workout_schedule_id" :(self.workOutModel?.data?.workout_schedule_id)! , "day" :"\((self.workOutModel?.data?.workout_day)!)" ]
        WebService.shared.workOutDone(body: Body) { (success, error,model) in
            if success{
                DispatchQueue.main.async {
                    self.callWorkoutListApi()
                }
            }
        }
    }
}
