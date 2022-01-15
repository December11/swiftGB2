//
//  Date.swift
//  VKApp
//
//  Created by 👩🏻‍🎨 📱 december11 on 15.01.2022.
//

import Foundation

extension Date {
    enum DateFormat: String {
        case dateTime = "dd.MM.yy, HH:mm"
        case date = "dd.MM.yy"
    }
    
    func toString(dateFormat: DateFormat) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat.rawValue
        return dateFormatter.string(from: self)
    }
}
