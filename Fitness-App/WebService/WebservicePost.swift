//
//  WebservicePost.swift
//  Fitness-App
//
//  Created by Netventure on 16/03/20.
//  Copyright © 2020 freelancer. All rights reserved.
//

import Foundation
extension WebService{
    func workOutDetails(body : [String:String],CompletionBlock:@escaping(Bool,String?,WorkoutDetailModel?)-> Void){
        let url = URL(string: "\(BASE_URL + WORKOUT_DETAILS)")
        do {
            var request  = URLRequest(url: url!)
            request.httpMethod = "POST"
            let jsonData = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            if let _ = UserDefaults.standard.value(forKey: "token_type"), let _ = UserDefaults.standard.value(forKey: "token"){
                   request.addValue("\(String(describing:UserDefaults.standard.value(forKey: "token_type")!)) \(String(describing:UserDefaults.standard.value(forKey: "token")!))", forHTTPHeaderField: "Authorization")
               }
            request.httpBody = jsonData
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                let jsonDecoder = JSONDecoder()
                do{
                    if let _ = data{
                        let responseModel = try jsonDecoder.decode(WorkoutDetailModel.self, from: data!)
                        if responseModel.code != 200{
                            CompletionBlock(false,responseModel.message,nil)
                        }else{
                            CompletionBlock(true,nil,responseModel)
                        }
                    }else{
                        CompletionBlock(false,"something went wrong.Please try again after sometime.",nil)
                        return
                    }
                }catch{
                }
            }
            task.resume()
        }catch{
        }
    }
    
    func emailVerification(body : [String:String],CompletionBlock:@escaping(Bool,String?,ForgotPassword_SuccessModel?)-> Void){
        let url = URL(string: "\(BASE_URL + FORGOT_PASSWORD_URL)")
        do {
            var request  = URLRequest(url: url!)
            request.httpMethod = "POST"
            let jsonData = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
//            if let _ = UserDefaults.standard.value(forKey: "token_type"), let _ = UserDefaults.standard.value(forKey: "token"){
//                   request.addValue("\(String(describing:UserDefaults.standard.value(forKey: "token_type")!)) \(String(describing:UserDefaults.standard.value(forKey: "token")!))", forHTTPHeaderField: "Authorization")
//               }
            request.httpBody = jsonData
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                let jsonDecoder = JSONDecoder()
                do{
                    if let _ = data{
                        let responseModel = try jsonDecoder.decode(ForgotPassword_SuccessModel.self, from: data!)
                        if responseModel.code != 200{
                            CompletionBlock(false,responseModel.message,nil)
                        }else{
                            CompletionBlock(true,nil,responseModel)
                        }
                    }else{
                        CompletionBlock(false,"something went wrong.Please try again after sometime.",nil)
                        return
                    }
                }catch{
                }
            }
            task.resume()
        }catch{
        }
    }
    
    func workOutDone(body : [String:String],CompletionBlock:@escaping(Bool,String?,WorkoutDoneModel?)-> Void){
        let url = URL(string: "\(BASE_URL + WORKOUT_DONE_URL)")
        do {
            var request  = URLRequest(url: url!)
            request.httpMethod = "POST"
            let jsonData = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            if let _ = UserDefaults.standard.value(forKey: "token_type"), let _ = UserDefaults.standard.value(forKey: "token"){
                   request.addValue("\(String(describing:UserDefaults.standard.value(forKey: "token_type")!)) \(String(describing:UserDefaults.standard.value(forKey: "token")!))", forHTTPHeaderField: "Authorization")
               }
            request.httpBody = jsonData
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                let jsonDecoder = JSONDecoder()
                do{
                    if let _ = data{
                        let responseModel = try jsonDecoder.decode(WorkoutDoneModel.self, from: data!)
                        if responseModel.code != 200{
                            CompletionBlock(false,responseModel.message,nil)
                        }else{
                            CompletionBlock(true,nil,responseModel)
                        }
                    }else{
                        CompletionBlock(false,"something went wrong.Please try again after sometime.",nil)
                        return
                    }
                }catch{
                }
            }
            task.resume()
        }catch{
        }
    }
    
    //GENERATE_HASH_URL
    
    func generatehash(body : [String:String],CompletionBlock:@escaping(Bool,String?,HashResponseModel?)-> Void){
        let url = URL(string: "\(BASE_URL + GENERATE_HASH_URL)")
        do {
            var request  = URLRequest(url: url!)
            request.httpMethod = "POST"
            let jsonData = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            if let _ = UserDefaults.standard.value(forKey: "token_type"), let _ = UserDefaults.standard.value(forKey: "token"){
                   request.addValue("\(String(describing:UserDefaults.standard.value(forKey: "token_type")!)) \(String(describing:UserDefaults.standard.value(forKey: "token")!))", forHTTPHeaderField: "Authorization")
               }
            request.httpBody = jsonData
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                let jsonDecoder = JSONDecoder()
                do{
                    if let _ = data{
                        let responseModel = try jsonDecoder.decode(HashResponseModel.self, from: data!)
                        if responseModel.code != 200{
                            CompletionBlock(false,responseModel.message,nil)
                        }else{
                            CompletionBlock(true,nil,responseModel)
                        }
                    }else{
                        CompletionBlock(false,"something went wrong.Please try again after sometime.",nil)
                        return
                    }
                }catch{
                }
            }
            task.resume()
        }catch{
        }
    }
    
    func successResponse(body : [String:String],CompletionBlock:@escaping(Bool,String?,SuccessResponseModel?)-> Void){
        let url = URL(string: "\(BASE_URL + PAYMENT_SUCCESS_URL)")
        do {
            var request  = URLRequest(url: url!)
            request.httpMethod = "POST"
            let jsonData = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            if let _ = UserDefaults.standard.value(forKey: "token_type"), let _ = UserDefaults.standard.value(forKey: "token"){
                   request.addValue("\(String(describing:UserDefaults.standard.value(forKey: "token_type")!)) \(String(describing:UserDefaults.standard.value(forKey: "token")!))", forHTTPHeaderField: "Authorization")
               }
            request.httpBody = jsonData
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                let jsonDecoder = JSONDecoder()
                do{
                    if let _ = data{
                        let responseModel = try jsonDecoder.decode(SuccessResponseModel.self, from: data!)
                        if responseModel.code != 200{
                            CompletionBlock(false,responseModel.message,nil)
                        }else{
                            CompletionBlock(true,nil,responseModel)
                        }
                    }else{
                        CompletionBlock(false,"something went wrong.Please try again after sometime.",nil)
                        return
                    }
                }catch{
                }
            }
            task.resume()
        }catch{
        }
    }
    
    func failureResponse(body : [String:String],CompletionBlock:@escaping(Bool,String?,SuccessResponseModel?)-> Void){
        let url = URL(string: "\(BASE_URL + PAYMENT_FAILURE_URL)")
        do {
            var request  = URLRequest(url: url!)
            request.httpMethod = "POST"
            let jsonData = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            if let _ = UserDefaults.standard.value(forKey: "token_type"), let _ = UserDefaults.standard.value(forKey: "token"){
                   request.addValue("\(String(describing:UserDefaults.standard.value(forKey: "token_type")!)) \(String(describing:UserDefaults.standard.value(forKey: "token")!))", forHTTPHeaderField: "Authorization")
               }
            request.httpBody = jsonData
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                let jsonDecoder = JSONDecoder()
                do{
                    if let _ = data{
                        let responseModel = try jsonDecoder.decode(SuccessResponseModel.self, from: data!)
                        if responseModel.code != 200{
                            CompletionBlock(false,responseModel.message,nil)
                        }else{
                            CompletionBlock(true,nil,responseModel)
                        }
                    }else{
                        CompletionBlock(false,"something went wrong.Please try again after sometime.",nil)
                        return
                    }
                }catch{
                }
            }
            task.resume()
        }catch{
        }
    }
}
