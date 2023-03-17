//
//  Ext+Date.swift
//  DemoVIPER
//
//  Created by mac on 15/03/23.
//

import Foundation

extension Date {
    static let formatterDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yy/MM/dd"
        return formatter
    }()
    var formattedYYMMDD: String {
        return Date.formatterDate.string(from: self)
    }
    
    func toString(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        formatter.timeZone = TimeZone.current
        formatter.locale = Locale.current
        return formatter.string(from: self)
    }
}
