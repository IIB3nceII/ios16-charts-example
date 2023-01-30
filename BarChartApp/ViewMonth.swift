//
//  ViewMonth.swift
//  BarChartApp
//
//  Created by Bence Papp on 2023. 01. 30..
//

import Foundation

struct ViewMonth: Identifiable {
    let id = UUID()
    let date: Date
    let viewCount: Int
}
