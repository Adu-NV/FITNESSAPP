//
//  WebService.swift
//  Fitness-App
//
//  Created by Netventure on 11/03/20.
//  Copyright © 2020 freelancer. All rights reserved.
//

import Foundation
import UIKit
import AFNetworking
//import FirebaseMessaging

enum NetworkRequestContentType : String {
    case json       = "application/json"
    case urlEncoded = "application/x-www-form-urlencoded"
    case text       = "text/html; charset=UTF-8"
}

enum NetworkRequestMethod : String {
    case get    = "GET"
    case put    = "PUT"
    case post   = "POST"
    case delete = "DELETE"
}

public class WebService{
    static let shared = WebService()
    func getPostString(params:[String:Any]) -> String
    {
        var data = [String]()
        for(key, value) in params
        {
            if key == "filter"{
                var str = ""
                for i in 0 ..< (value as! Array<String>).count{
                    str += (value as! Array<String>)[i]
                    if i < (value as! Array<String>).count - 1{
                        str += ","
                    }
                }
                data.append(key + "=\(str)")
            }else{
                data.append(key + "=\(value)")
            }
        }
        return data.map { String($0) }.joined(separator: "&")
    }
    
    //MARK:- AUTHORISATIONS REQUEST
    
    func setRequestWithAuth(urlPath:URL,contentType:NetworkRequestContentType?,requestMethod:NetworkRequestMethod?)->URLRequest{
        var urlRequest:URLRequest = URLRequest.init(url: urlPath)
        if let _method = requestMethod {
            urlRequest.httpMethod = _method.rawValue
        }
        if let _contentType = contentType {
            urlRequest.setValue(_contentType.rawValue, forHTTPHeaderField: "Content-Type")
        }
        urlRequest.setValue("application/json",forHTTPHeaderField: "Accept")
        if let _ = UserDefaults.standard.value(forKey: "token_type"), let _ = UserDefaults.standard.value(forKey: "token"){
            urlRequest.addValue("\(String(describing:UserDefaults.standard.value(forKey: "token_type")!)) \(String(describing:UserDefaults.standard.value(forKey: "token")!))", forHTTPHeaderField: "Authorization")
        }
        return urlRequest
    }
    
    func setRequestWithoutAuth(urlPath:URL,contentType:NetworkRequestContentType?,requestMethod:NetworkRequestMethod?,body:[String:String]?)->URLRequest{
        var urlRequest:URLRequest = URLRequest.init(url: urlPath)
        if let _method = requestMethod {
            urlRequest.httpMethod = _method.rawValue
        }
        if let _contentType = contentType {
            urlRequest.setValue(_contentType.rawValue, forHTTPHeaderField: "Content-Type")
        }
        if let _body = body{
            do{
                let jsonData = try JSONSerialization.data(withJSONObject: _body, options: .prettyPrinted)
                urlRequest.httpBody = jsonData
            }catch{
            }
        }
        urlRequest.setValue("application/json",forHTTPHeaderField: "Accept")
        return urlRequest
    }
    
    // MARK:- NO AUTHORISATION REQUIRED FUNCTIONS
    
    func login(email:String,password:String,CompletionBlock:@escaping(Bool,String?,LoginSuccess_Model?)-> Void){
        let url = URL(string: "\(BASE_URL + LOGIN_URL)")
        let body = ["username":email,"password":password]
        do {
            var request  = URLRequest(url: url!)
            request.httpMethod = "POST"
            let jsonData = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            request.httpBody = jsonData
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                let jsonDecoder = JSONDecoder()
                do{
                    if let _ = data{
                        let responseModel = try jsonDecoder.decode(LoginSuccess_Model.self, from: data!)
                        if responseModel.code != 200{
                            CompletionBlock(false,responseModel.message,nil)
                        }else{
                            UserDefaults.standard.set(responseModel.data?.token_type as! String, forKey: "token_type")
                            UserDefaults.standard.set(responseModel.data?.token as! String, forKey: "token")//value(forKey: "token_type")
                            UserDefaults.standard.set(true, forKey: "logged")
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
    
    //MARK:- GET METHOD
    
    func workOutListApi(CompletionBlock:@escaping(Bool,String?,WorkoutListModel?)-> Void){
        let url = URL(string: "\(BASE_URL + WORKOUT_LIST)")
        let urlRequest = setRequestWithAuth(urlPath: url!, contentType: nil, requestMethod: .get)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            do{
                if let _ = data{
                    let responseModel = try jsonDecoder.decode(WorkoutListModel.self, from: data!)
                    if responseModel.code != 200{
                        if responseModel.code == 401{
                            //                            self.forceLogout()
                        }else{
                            CompletionBlock(false,responseModel.message,nil)
                        }
                        
                    }else{
                        CompletionBlock(true,nil,responseModel)
                    }
                }else{
                    CompletionBlock(false,"no internet connection",nil)
                }
            }catch{
            }
        }
        task.resume()
    }
    
    func dietListAPI(CompletionBlock:@escaping(Bool,String?,DietSuccessModel?)-> Void){
        let url = URL(string: "\(BASE_URL + DIET_DETAILS_URL)")
        let urlRequest = setRequestWithAuth(urlPath: url!, contentType: nil, requestMethod: .get)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            do{
                if let _ = data{
                    let responseModel = try jsonDecoder.decode(DietSuccessModel.self, from: data!)
                    if responseModel.code != 200{
                        if responseModel.code == 401{
                            //                            self.forceLogout()
                        }else{
                            CompletionBlock(false,responseModel.message,nil)
                        }
                        
                    }else{
                        CompletionBlock(true,nil,responseModel)
                    }
                }else{
                    CompletionBlock(false,"no internet connection",nil)
                }
            }catch{
            }
        }
        task.resume()
    }
    
    func ProfileListAPI(CompletionBlock:@escaping(Bool,String?,ProfileDetailModel?)-> Void){
        let url = URL(string: "\(BASE_URL + PROFILE_DETAILS_URL)")
        let urlRequest = setRequestWithAuth(urlPath: url!, contentType: nil, requestMethod: .get)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            do{
                if let _ = data{
                    let responseModel = try jsonDecoder.decode(ProfileDetailModel.self, from: data!)
                    if responseModel.code != 200{
                        if responseModel.code == 401{
                            //                            self.forceLogout()
                        }else{
                            CompletionBlock(false,responseModel.message,nil)
                        }
                        
                    }else{
                        CompletionBlock(true,nil,responseModel)
                    }
                }else{
                    CompletionBlock(false,"no internet connection",nil)
                }
            }catch{
            }
        }
        task.resume()
    }
    
    func packageListAPI(CompletionBlock:@escaping(Bool,String?,PackageListModel?)-> Void){
        let url = URL(string: "\(BASE_URL + PACKAGE_LIST_URL)")
        let urlRequest = setRequestWithAuth(urlPath: url!, contentType: nil, requestMethod: .get)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            do{
                if let _ = data{
                    let responseModel = try jsonDecoder.decode(PackageListModel.self, from: data!)
                    if responseModel.code != 200{
                        if responseModel.code == 401{
                        }else{
                            CompletionBlock(false,responseModel.message,nil)
                        }
                    }else{
                        CompletionBlock(true,nil,responseModel)
                    }
                }else{
                    CompletionBlock(false,"no internet connection",nil)
                }
            }catch{
            }
        }
        task.resume()
    }
    
    func paymentHistoryListAPI(CompletionBlock:@escaping(Bool,String?,TranscationHistoryModel?)-> Void){
        let url = URL(string: "\(BASE_URL + PAYMENT_HISTORY_URL)")
        let urlRequest = setRequestWithAuth(urlPath: url!, contentType: nil, requestMethod: .get)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            do{
                if let _ = data{
                    let responseModel = try jsonDecoder.decode(TranscationHistoryModel.self, from: data!)
                    if responseModel.code != 200{
                        if responseModel.code == 401{
                        }else{
                            CompletionBlock(false,responseModel.message,nil)
                        }
                    }else{
                        CompletionBlock(true,nil,responseModel)
                    }
                }else{
                    CompletionBlock(false,"no internet connection",nil)
                }
            }catch{
            }
        }
        task.resume()
    }
    
    func packageDetailsAPI(id:String,CompletionBlock:@escaping(Bool,String?,PackageDetailListModel?)-> Void){
        let url = URL(string: "\(BASE_URL + PACKAGE_DETAILS_URL + id)")
        let urlRequest = setRequestWithAuth(urlPath: url!, contentType: nil, requestMethod: .get)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            do{
                if let _ = data{
                    let responseModel = try jsonDecoder.decode(PackageDetailListModel.self, from: data!)
                    if responseModel.code != 200{
                        if responseModel.code == 401{
                        }else{
                            CompletionBlock(false,responseModel.message,nil)
                        }
                    }else{
                        CompletionBlock(true,nil,responseModel)
                    }
                }else{
                    CompletionBlock(false,"no internet connection",nil)
                }
            }catch{
            }
        }
        task.resume()
    }
    
    func signOutAPI(CompletionBlock:@escaping(Bool,String?,SignOutModel?)-> Void){
        let url = URL(string: "\(BASE_URL + SIGN_OUT_URL)")
        let urlRequest = setRequestWithAuth(urlPath: url!, contentType: nil, requestMethod: .get)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            do{
                if let _ = data{
                    let responseModel = try jsonDecoder.decode(SignOutModel.self, from: data!)
                    if responseModel.code != 200{
                        if responseModel.code == 401{
                        }else{
                            CompletionBlock(false,responseModel.message,nil)
                        }
                    }else{
                        CompletionBlock(true,nil,responseModel)
                    }
                }else{
                    CompletionBlock(false,"no internet connection",nil)
                }
            }catch{
            }
        }
        task.resume()
    }
   
    
}
