//
//  ContentView.swift
//  SwiftUIGraphing
//
//  Created by Brigette Valdez on 3/25/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var dataPicker: String = "Data1"
    
    private var data: [String: [Int]] = [
         "Data1": [28, 25, 30, 29, 23],
         "Data2": [3, 1, 2, 4, 3],
         "Data3": [2, 6, 8, 3, 4]
    ]
    
    
    var body: some View {
        VStack {
            Text("Let's Graph!")
                .foregroundColor(.white)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            Picker("", selection: $dataPicker) {
                Text("Data1").tag("Data1")
                Text("Data2").tag("Data2")
                Text("Data3").tag("Data3")
            }.pickerStyle(SegmentedPickerStyle())
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
