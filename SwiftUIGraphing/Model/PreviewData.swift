//
//  PreviewData.swift
//  SwiftUIGraphing
//
//  Created by Brigette Valdez on 3/25/21.
//

import Foundation

struct PreviewData {
    
    
    static let ringsTabVM = PickerLabelViewModel(imgName: "rings", tag: .rings)
    static let capsuleTabVM = PickerLabelViewModel(imgName: "capsule", tag: .capsule)
    static let tabVMs = [ringsTabVM, capsuleTabVM]
    
    static public var data:ChartData = ChartData(points: [37,72,51,22,39,47,66,85,50])
    static public var values:ChartData = ChartData(values: [("2017 Q3",220),
                                                            ("2017 Q4",1550),
                                                            ("2018 Q1",8180),
                                                            ("2018 Q2",18440),
                                                            ("2018 Q3",55840),
                                                            ("2018 Q4",63150), ("2019 Q1",50900), ("2019 Q2",77550), ("2019 Q3",79600), ("2019 Q4",92550)])
    static public let barGraphVM = CapsuleBarGraphViewModel(name: "Graph Name", data: values, graphColor: .blue)
    
    
    static let ringData = RingData("2017 Q1", fillVal: 770, maxVal: 1000)
    static public var ringDataSet: RingDataSet = RingDataSet(values: [("2017 Q3",220,1000),
                                                            ("2017 Q4",250,1000),
                                                            ("2018 Q1",980,1000),
                                                            ("2018 Q2",100,1000),
                                                            ("2018 Q3",621,1000),
                                                            ("2018 Q4",08,1000),
                                                            ("2019 Q1",550,1000)])
    static public let ringColors = RingColors(background: Colors.honeydew, start: Colors.emerald, end: Colors.emerald)
    static public let ringGraphVM = RingGraphViewModel(name: "Ring Graph", data: ringDataSet)
    
    static public let ringColorSets: [RingColors] = [RingColorSets.yellow, RingColorSets.blue,  RingColorSets.orngPink, RingColorSets.prplBlue, RingColorSets.green]
    static func randomGradient() -> RingColors {
        return ringColorSets.randomElement() ?? RingColorSets.yellow
    }
    
    
}
