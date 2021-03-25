//
//  CapsuleBarGraphViewModel.swift
//  SwiftUIGraphing
//
//  Created by Brigette Valdez on 3/25/21.
//

import Foundation
import SwiftUI

class CapsuleBarGraphViewModel: ObservableObject {
    
    @Published var graphName: String
    @Published var data: ChartData
    var graphColor: Color
    
    
    init(name: String, data: ChartData, graphColor: Color) {
        self.graphName = name
        self.data = data
        self.graphColor = graphColor
    }
    
    var maxValue: Double {
        guard let max = data.onlyPoints().max() else { return 1.0 }
        return max
    }
}
