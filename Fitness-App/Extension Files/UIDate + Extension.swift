//
//  UIDate + Extension.swift
//  Fitness-App
//
//  Created by Netventure on 23/03/20.
//  Copyright © 2020 freelancer. All rights reserved.
//

import Foundation
import UIKit

extension Date{
    func convertDate(timestamp : String) -> String{
        var localDate = ""
        if let timeResult = (Double(timestamp)) {
            let date = NSDate(timeIntervalSince1970: timeResult / 1000.0)
            let dateFormatter = DateFormatter()
            dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
            dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
            dateFormatter.timeZone = NSTimeZone() as TimeZone
            
            localDate = getCurrentShortDate(str: date as Date)// dateFormatter.string(from: date as Date)
        }
        return localDate
    }
    
    func getCurrentShortDate() -> String {
        var todaysDate = Date()
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let DateInFormat = dateFormatter.string(from: todaysDate)

        return DateInFormat
    }
    
    func getCurrentShortDate(str : Date) -> String {
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let DateInFormat = dateFormatter.string(from: str)

        return DateInFormat
    }
}
