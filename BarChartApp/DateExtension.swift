//
//  DateExtension.swift
//  BarChartApp
//
//  Created by Bence Papp on 2023. 01. 30..
//

import Foundation

extension Date {
    static func from(year: Int, month: Int, day: Int) -> Date {
        let components = DateComponents(year: year, month: month, day: day)
        print(Calendar.current.date(from: components)!)
        return Calendar.current.date(from: components)!
    }
}
