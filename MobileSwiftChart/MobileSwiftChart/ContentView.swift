//
//  ContentView.swift
//  MobileSwiftChart
//
//  Created by Павел Курзо on 22/11/2022.
//

import SwiftUI
import Charts

struct MobileOPUsage: Identifiable {
    var id = UUID()
    let device: String
    let percentage: Double
}

struct ContentView: View {
    let stats: [MobileOPUsage] = [
        MobileOPUsage(device: "Android", percentage: 89.8),
        MobileOPUsage(device: "iOS", percentage: 9.92),
        MobileOPUsage(device: "Samsung", percentage: 0.12),
        MobileOPUsage(device: "Windows", percentage: 0.08),
        MobileOPUsage(device: "Series 40", percentage: 0.03),
        MobileOPUsage(device: "Nokia Unknown", percentage: 0.03),
        MobileOPUsage(device: "Other", percentage: 0.03),
    ]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Mobile Operating System Market Share Poland")
                    .fontWeight(.medium)
                    .font(.system(size: 24))
                
                ScrollView {
                    Chart(stats) { item in
                        BarMark(
                            x: .value("Department", item.device),
                            y: .value("Profit", item.percentage)
                        )
                        .foregroundStyle(by: .value("Department", item.device))
                        .opacity(0.5)
                        .symbol(by: .value("Department", item.device))
                    }
                    .chartPlotStyle(content: { plotArea in
                        plotArea.background(.orange.opacity(0.3))
                    })
                    .frame(height: 300)
                    .padding()
                    
                    Chart(stats) { item in
                        RectangleMark(
                            x: .value("Department", item.device),
                            y: .value("Profit", item.percentage)
                        )
                        .foregroundStyle(by: .value("Department", item.device))
                        .opacity(0.5)
                        .symbol(by: .value("Department", item.device))
                    }
                    .chartPlotStyle(content: { plotArea in
                        plotArea.background(.orange.opacity(0.3))
                    })
                    .frame(height: 300)
                    .padding()
                }
            }
            .padding([.leading, .trailing, .top], 10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
