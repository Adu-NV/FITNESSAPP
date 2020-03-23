//
//  Definitions.swift
//  Fitness-App
//
//  Created by Netventure on 09/03/20.
//  Copyright © 2020 freelancer. All rights reserved.
//

import UIKit
import Foundation

// MARK:- URL Constants

    let BASE_URL :String                                                    = "https://app.phoenixfitnesscentre.com/api/v1/"

//let ASSET_URL : String                                            "https://app.fada.in/uploads/"

let YOUTUBE_LINK_URL : String                                   = "https://www.youtube.com/watch?v="

    let LOGIN_URL : String                                              = "login"
    let DIET_DETAILS_URL : String                                  = "diet_list"
    let WORKOUT_LIST : String                                       = "workout_list"

    let FORGOT_PASSWORD_URL : String                      = "forgot_password"

    let VALIDATE_TOKEN_URL : String                            = "validate_token/{token}/{email}"

  
    let WORKOUT_DETAILS : String                               = "workout_details"
    let WORKOUT_DONE_URL : String                          = "workout_done"
    let PROFILE_DETAILS_URL : String                           = "profile_details"
    let PROFILE_UPDATE_URL : String                           = "profile_edit"

    let SIGN_OUT_URL : String                                      = "signout"

    let PACKAGE_LIST_URL : String                                = "package_list"
    let PACKAGE_DETAILS_URL : String                         = "package_details/"

    let GENERATE_HASH_URL: String                            = "generate_hash"
    let PAYMENT_SUCCESS_URL : String                       = "payment_success"
    let PAYMENT_FAILURE_URL : String                        = "payment_failure"
    let PAYMENT_HISTORY_URL : String                       = "transaction_history"


let SUCCESS_URL = "https://www.payumoney.com/mobileapp/payumoney/success.php"
let FAILURE_URL = "https://www.payumoney.com/mobileapp/payumoney/failure.php"

// MARK:- String Constants

    let FITNESSAPP_TITLE : String                                  = "Fitness App"

    let INVALID_PASSWORD :String                             = "Invalid password, please try again."
    let INVALID_USERNAME :String                              = "Invalid user, please try again."

    let EMPTY_MESSAGE :String                                    = "Please fill all the fields."
    let EMPTY_USERNAME :String                                 = "Username could not be empty."
    let EMPTY_PASSWORD :String                                = "Password could not be empty."

    let PROFILEIMAGE_UPDATE : String                       = "Profile image updated."
    let PROFILENAME_UPDATE : String                        = "Profile name updated."
 
//MARK:- Invalid Message form JSON
 //"code": 400

    let LOGIN_INVALIDMESSAGE : String                     = "You have entered an invalid username or password. Please try again."
    let LOGIN_REQUIREDMESSAGE   : String                = "Both username and password required for login."
    let LOGOUT_FAILUREMESSAGE   : String                =  "Session Expired."

// "code": 404

    let FORGOTPASSWORD_INVALIDMESSAGE : String    = "We cant find a user with that e-mail address."

//MARK:- Success Message from JSON
//code : 200

    let FORGOTPASSWORD_SUCCESS : String               = "We have e-mailed your password reset link!"
    let LOGOUT_SUCCESS : String                                 = "Successfully logged out."
let SUCCESS : String                                                      = "Successful"



// MARK:- Color Constants

let LOGIN_BUTTON_COLOR : UIColor                            = UIColor(red: 184 / 255, green: 24 / 255, blue: 30 / 255, alpha: 1)               // hex :-    #B8181E
let LOGIN_TEXT_COLOR : UIColor                                   = UIColor(red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 1)          // hex :-      #FFFFFF
let PLACEHOLDER_TEXT_COLOR : UIColor                      = UIColor(red: 128 / 255, green: 128 / 255, blue: 128 / 255, alpha: 1)          // hex :-      #808080
let LBMI_BUTTON_COLOR : UIColor                               = UIColor(red: 0 / 255, green: 122 / 255, blue: 255 / 255, alpha: 1)              // hex :-       #007AFF
let NOWORKOUT_LABEL_COLOR : UIColor                    = UIColor(red: 255 / 255, green: 204 / 255, blue: 0 / 255, alpha: 1)              // hex :-       #FFCC00
let WORKOUTNAME_LABEL_COLOR : UIColor                = UIColor(red: 0 / 255, green: 0 / 255, blue: 0 / 255, alpha: 1)                      // hex :-       #000000
let WORKOUTREST_LABEL_COLOR : UIColor                  = UIColor(red: 0 / 255, green: 0 / 255, blue: 0 / 255, alpha: 1)                      // hex :-        #000000
let WORKOUTRCOUNT_LABEL_COLOR : UIColor           = UIColor(red: 230 / 255, green: 32 / 255, blue: 37 / 255, alpha: 1)             // hex :-        #E62025
let WORKOUTRSET_LABEL_COLOR : UIColor                  = UIColor(red: 230 / 255, green: 32 / 255, blue: 37 / 255, alpha: 1)              // hex :-       #E62025
let SWIPE_GRAY_COLOR : UIColor                                  = UIColor(red: 170 / 255, green: 170 / 255, blue: 170 / 255, alpha: 1)          // hex :-        #AAAAAA
let SWIPE_GREEN_COLOR : UIColor                                = UIColor(red: 0 / 255, green: 161 / 255, blue: 0 / 255, alpha: 1)                   // hex :-       #00A100
let DONE_BUTTON_COLOR : UIColor                             = UIColor(red: 224 / 255, green: 68 / 255, blue: 68 / 255, alpha: 1)             // hex :-         #E04242
let CONTACTDETAIL_TITLE_COLOR : UIColor                 = UIColor(red: 230 / 255, green: 32 / 255, blue: 37 / 255, alpha: 1)             // hex :-         #E62025
let PROFILE_GRAY_COLOR : UIColor                               = UIColor(red: 111 / 255, green: 111 / 255, blue: 111 / 255, alpha: 1)         // hex :-         #6F6F6F
let PROFILE_BLACK_COLOR : UIColor                             = UIColor(red: 0 / 255, green: 0 / 255, blue: 0 / 255, alpha: 1)                     // hex :-         #000000
let PACKAGE_BUTTON_COLOR : UIColor                       = UIColor(red: 225 / 255, green: 19 / 255, blue: 66 / 255, alpha: 1)             // hex :-         #E11342
let PHYSICAL_MEASUREMENT_COLOR : UIColor           = UIColor(red: 179 / 255, green: 0 / 255, blue: 22 / 255, alpha: 1)               // hex :-         #B3001C
let TINT_COLOR : UIColor                                               = UIColor(red: 230 / 255, green: 32 / 255, blue: 37 / 255, alpha: 1)              // hex :-       #E62025

let MERCHANT_KEY : String                                                    = "9X6iTBBc"
let MERCHANT_SALT : String                                                  = "yaUeB86pLC"
let MERCHANT_HEADER : String                                            = "OXScrAi4J1A/TEdrjqot06AEUwPWq0/NVQ8BYWRlAz0="
let PRODUCT_NAME : String                                                  = "Phoenix"
let TRANSACTION_ID :String                                                  = "0nf7"

class DateFunction{
    func getDate() -> Int {
            let timeInMiliSecDate = Date()
        let timeInMiliSec = Int (timeInMiliSecDate.timeIntervalSince1970 * 1000)
        print(timeInMiliSec)
        return timeInMiliSec
    }

}

