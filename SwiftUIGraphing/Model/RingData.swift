//
//  RingData.swift
//  SwiftUIGraphing
//
//  Created by Brigette Valdez on 3/25/21.
//

import Foundation


import Foundation
import SwiftUI

public class RingDataSet: ObservableObject, Identifiable {
    @Published var rings: [RingData]
    var valuesGiven: Bool = false
    var ID = UUID()
    
    
    public init<N: BinaryInteger>(values:[(String,N, N)]){
        self.rings = values.map{ RingData($0.0, fillVal: Double($0.1), maxVal: Double($0.2)) }
        self.valuesGiven = true
    }
    public init<N: BinaryFloatingPoint>(values:[(String,N, N)]){
        self.rings = values.map { RingData($0.0, fillVal: Double($0.1), maxVal: Double($0.2)) }
        self.valuesGiven = true
    }
    public init<N: BinaryInteger>(numberValues:[(N,N,N)]){
        self.rings = numberValues.map { RingData(String($0.0), fillVal: Double($0.1), maxVal: Double($0.2)) }
        self.valuesGiven = true
    }
    public init<N: BinaryFloatingPoint & LosslessStringConvertible>(numberValues:[(N,N,N)]){
        self.rings = numberValues.map { RingData(String($0.0), fillVal: Double($0.1), maxVal: Double($0.2)) }
        self.valuesGiven = true
    }
    
}


public struct RingData: Hashable, Identifiable {

    let description: String
    let fillValue: Double
    let maxValue: Double
    public let id: UUID
    
    init(_ desc: String, fillVal: Double, maxVal: Double) {
        self.description = desc
        self.fillValue = fillVal
        self.maxValue = maxVal
        self.id = UUID()
    }
    
    public static func == (lhs: RingData, rhs: RingData) -> Bool {
        return lhs.id == rhs.id
    }
}
