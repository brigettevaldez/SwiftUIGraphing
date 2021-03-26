//
//  ChartData.swift
//  SwiftUIGraphing
//
//  Created by Brigette Valdez on 3/25/21.
//

import Foundation
import SwiftUI

public class ChartData: ObservableObject, Identifiable {
    @Published var points: [Point]
    var valuesGiven: Bool = false
    var ID = UUID()
    
    public init<N: BinaryFloatingPoint>(points:[N]) {
        self.points = points.map { Point("", Double($0)) }
    }
    public init<N: BinaryInteger>(values:[(String,N)]){
        self.points = values.map{ Point($0.0, Double($0.1)) }
        self.valuesGiven = true
    }
    public init<N: BinaryFloatingPoint>(values:[(String,N)]){
        self.points = values.map { Point($0.0, Double($0.1)) }
        self.valuesGiven = true
    }
    public init<N: BinaryInteger>(numberValues:[(N,N)]){
        self.points = numberValues.map { Point(String($0.0), Double($0.1)) }
        self.valuesGiven = true
    }
    public init<N: BinaryFloatingPoint & LosslessStringConvertible>(numberValues:[(N,N)]){
        self.points = numberValues.map { Point(String($0.0), Double($0.1)) }
        self.valuesGiven = true
    }
    
    public func onlyPoints() -> [Double] {
        return self.points.map{ $0.value }
    }
}


public struct Point: Hashable {

    let description: String
    let value: Double
    let id: UUID
    
    init(_ desc: String, _ val: Double) {
        self.description = desc
        self.value = val
        self.id = UUID()
    }
    
    public static func == (lhs: Point, rhs: Point) -> Bool {
        return lhs.id == rhs.id
    }
}
