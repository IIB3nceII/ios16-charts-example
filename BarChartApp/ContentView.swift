//
//  ContentView.swift
//  BarChartApp
//
//  Created by Bence Papp on 2023. 01. 30..
//

import Charts
import SwiftUI

struct ContentView: View {
    let viewMonths: [ViewMonth] = [
        .init(date: Date.from(year: 2023, month: 1, day: 1), viewCount: 55000),
        .init(date: Date.from(year: 2023, month: 2, day: 1), viewCount: 55000),
        .init(date: Date.from(year: 2023, month: 3, day: 1), viewCount: 34534),
        .init(date: Date.from(year: 2023, month: 4, day: 1), viewCount: 55000),
        .init(date: Date.from(year: 2023, month: 5, day: 1), viewCount: 44545),
        .init(date: Date.from(year: 2023, month: 6, day: 1), viewCount: 64565),
        .init(date: Date.from(year: 2023, month: 7, day: 1), viewCount: 55000),
        .init(date: Date.from(year: 2023, month: 8, day: 1), viewCount: 23443),
        .init(date: Date.from(year: 2023, month: 9, day: 1), viewCount: 123432),
        .init(date: Date.from(year: 2023, month: 10, day: 1), viewCount: 99000),
        .init(date: Date.from(year: 2023, month: 11, day: 1), viewCount: 11000),
        .init(date: Date.from(year: 2023, month: 12, day: 1), viewCount: 94000),
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Chart Example")
            Text("Chart values: \(viewMonths.reduce(0) { $0 + $1.viewCount })")
                .fontWeight(.semibold)
                .font(.footnote)
                .foregroundColor(.secondary)
                .padding(.bottom, 12)

            Chart {
                RuleMark(y: .value("Goal", 80000))
                    .foregroundStyle(Color.mint)
                    .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))
//                    .annotation(alignment: .leading) {
//                        Text("Goal")
//                            .font(.caption)
//                            .foregroundColor(.secondary)
//                    }

                ForEach(viewMonths) { month in
                    BarMark(
                        x: .value("Month", month.date, unit: .month),
                        y: .value("Views", month.viewCount)
                    )
                    .foregroundStyle(Color.pink.gradient)
                }
            }
            .frame(height: 180)
            .chartXAxis {
                AxisMarks(values: viewMonths.map { $0.date }) { _ in
//                    AxisGridLine()
//                    AxisTick()
                    AxisValueLabel(format: .dateTime.month(.narrow))
                }
            }
            .chartYAxis {
                AxisMarks { _ in
                    AxisValueLabel()
                    AxisGridLine()
                }
            }
            // .chartYScale(domain: 0 ... 200000)
            // .chartXAxis(.hidden)
            // .chartYAxis(.hidden)
//            .chartPlotStyle { plotContent in
//                plotContent
//                    .background(.black.gradient.opacity(0.3))
//            }

            HStack {
                Image(systemName: "line.diagonal")
                    .rotationEffect(Angle(degrees: 45))
                    .foregroundColor(.mint)
                Text("Goal")
                    .foregroundColor(.secondary)
            }
            .font(.caption2)
            .padding(.leading, 4)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
