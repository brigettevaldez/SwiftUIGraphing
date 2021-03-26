//
//  RingGraphViewModel.swift
//  SwiftUIGraphing
//
//  Created by Brigette Valdez on 3/25/21.
//

import Foundation

import Foundation
import SwiftUI

class RingGraphViewModel: ObservableObject {
    @Published var graphName: String
    @Published var data: RingDataSet
    
    init(name: String, data: RingDataSet) {
        self.graphName = name
        self.data = data
    }
    
}
