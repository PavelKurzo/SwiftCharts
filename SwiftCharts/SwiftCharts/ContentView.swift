//
//  ContentView.swift
//  SwiftCharts
//
//  Created by Павел Курзо on 22/11/2022.
//

import SwiftUI
import Charts

struct Item: Identifiable {
    var id = UUID()
    let type: String
    let value: Double
}

struct ContentView: View {
    let items: [Item] = [
    Item(type: "Engineering", value: 100),
    Item(type: "Design", value: 35),
    Item(type: "Operations", value: 72),
    Item(type: "Sales", value: 22),
    Item(type: "Mgmt", value: 130),
    ]
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                // bar, line, ruler, point
                Chart(items) { item in
                    BarMark(
                        x: .value("Department", item.type),
                        y: .value("Profit", item.value)
                    )
                    .foregroundStyle(Color.green.gradient)
                }
                .frame(height: 200)
                .padding()
                
                Chart(items) { item in
                    LineMark(
                        x: .value("Department", item.type),
                        y: .value("Profit", item.value)
                    )
                    .foregroundStyle(Color.red.gradient)
                }
                .frame(height: 200)
                .padding()
                
                Chart(items) { item in
                    AreaMark(
                        x: .value("Department", item.type),
                        y: .value("Profit", item.value)
                    )
                    .foregroundStyle(Color.blue.gradient)
                }
                .frame(height: 200)
                .padding()
                
                Chart(items) { item in
                    PointMark(
                        x: .value("Department", item.type),
                        y: .value("Profit", item.value)
                    )
                    .foregroundStyle(Color.yellow.gradient)
                }
                .frame(height: 200)
                .padding()
                
                Chart(items) { item in
                    RectangleMark(
                        x: .value("Department", item.type),
                        y: .value("Profit", item.value)
                    )
                    .foregroundStyle(Color.black.gradient)
                }
                .frame(height: 200)
                .padding()
                
                Chart(items) { item in
                    RuleMark(
                        x: .value("Department", item.value)
                    )
                    .foregroundStyle(Color.orange.gradient)
                }
                .frame(height: 200)
                .padding()
            }
            .navigationTitle("Charts")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
