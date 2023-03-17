//
//  Ext+String.swift
//  DemoVIPER
//
//  Created by mac on 15/03/23.
//

import Foundation

extension String {
    func toDate(_ format: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        return dateFormatter.date(from: self) ?? Date()
    }
}
