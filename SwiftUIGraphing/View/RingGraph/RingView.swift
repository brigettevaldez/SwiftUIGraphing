//
//  RingView.swift
//  SwiftUIGraphing
//
//  Created by Brigette Valdez on 3/25/21.
//

import SwiftUI

import SwiftUI

struct RingColors {
    var background: Color
    var start: Color
    var end: Color
}

struct RingView: View {
    
    @State var currentPercentage: Double = 0
    @State var showInnerLabel: Bool = true
    @State private var ringMarker: Bool = true
    @State var frameSize: CGSize = .zero
    @State var labelText: String? = nil
    /*percentage -> 1 = 360 degrees
     */

    
    var percentage: Double //the fill percentage is 
    var ringColors: RingColors
    var thickness: CGFloat
    var labelColor: Color? = .black
    var index: Double
    
    init(data: RingData, colors: RingColors, ringThickness: CGFloat = 25, showLabel: Bool = true, index: Double = 1.0) {
        self.percentage = (data.fillValue / data.maxValue) //* 360.0
        self.ringColors = colors
        self.thickness = ringThickness
        self.index = index
        self.showInnerLabel = showLabel
        self.labelText = data.description
    }
    
    
    private var animation: Animation {
        Animation.easeOut
    }
    
    var body: some View {
        let gradient = AngularGradient(gradient: Gradient(colors: [ringColors.start, ringColors.end]), center: .center, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 360 * currentPercentage))
        GeometryReader { geometry in
             return ZStack {
                Color.clear.preference(key: SizePreferenceKey.self, value: geometry.size)
                RingBackgroundShape(thickness: thickness)
                    .fill(ringColors.background)
                RingShape(currentPercentage: currentPercentage, thickness: thickness)
                    .fill(gradient)
                    .rotationEffect(.init(degrees: -90))
                    .drawingGroup()
                    .onAppear() {
                        DispatchQueue.main.asyncAfter(deadline: .now() + (1.5 + (index * 0.3))) {
                            withAnimation(self.animation) {
                                if percentage > 0 { ringMarker = false }
                                self.currentPercentage = self.percentage
                            }
                        }
                    }
                    
                /*RingTipShape(currentPercentage: currentPercentage, thickness: thickness)
                    .fill(currentPercentage > 1 ? ringColors.end : .clear)
                    .rotationEffect(.init(degrees: -90))
                    .onAppear() {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            withAnimation(self.animation) {
                                if percentage > 0 { ringMarker = false }
                                self.currentPercentage = self.percentage
                            }
                        }
                    }*/
                if showInnerLabel {
                    Text(labelText ?? "")
                        .foregroundColor(labelColor)
                        .font(.regFourteen)
                }
                if ringMarker { ringStart }
            }.frame(width: geometry.size.width, height: geometry.size.width, alignment: .center)
             .onPreferenceChange(SizePreferenceKey.self, perform: { value in
                 self.frameSize = value
             })
        }
        
    }
    
    var ringStart: some View {
         VStack {
             ZStack {
                 Circle()
                     .fill(ringColors.start)
                    .frame(width: (thickness > 0 ? thickness : 1), height: (thickness > 0 ? thickness : 1), alignment: .top)
                     .padding(.top, thickness/2)
                 
             }
             Spacer()
         }
     }

   
}

struct SizePreferenceKey: PreferenceKey {
    typealias Value = CGSize
    static var defaultValue: Value = .zero

    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = nextValue()
    }
}

struct RingShape: Shape {
    
    var currentPercentage: Double
    var thickness: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.addArc(
            center: CGPoint(x: rect.width / 2, y: rect.height / 2),
            radius: rect.width / 2 - thickness,
            startAngle: Angle(degrees: 0),
            endAngle: Angle(degrees: 360 * currentPercentage),
            clockwise: false
        )
        
        return path
            .strokedPath(.init(lineWidth: thickness, lineCap: .round, lineJoin: .round))
    }
    
    var animatableData: Double {
        get { return currentPercentage }
        set { currentPercentage = newValue }
    }
    
}

/*struct RingTipShape: Shape {
    
    var currentPercentage: Double
    var thickness: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let angle = CGFloat((360 * currentPercentage) * .pi / 180)
        let controlRadius: CGFloat = rect.width / 2 - thickness
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let x = center.x + controlRadius * cos(angle)
        let y = center.y + controlRadius * sin(angle)
        let pointCenter = CGPoint(x: x, y: y)
        
        path.addEllipse(in:
                            CGRect(
                                x: pointCenter.x - thickness / 2,
                                y: pointCenter.y - thickness / 2,
                                width: thickness,
                                height: thickness
                            )
        )
        
        return path
    }
    
    var animatableData: Double {
        get { return currentPercentage }
        set { currentPercentage = newValue }
    }
    
}*/

struct RingBackgroundShape: Shape {
    
    var thickness: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(
            center: CGPoint(x: rect.width / 2, y: rect.height / 2),
            radius: rect.width / 2 - thickness,
            startAngle: Angle(degrees: 0),
            endAngle: Angle(degrees: 360),
            clockwise: false
        )
        
        return path
            .strokedPath(.init(lineWidth: thickness, lineCap: .round, lineJoin: .round))
    }
    
}



struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(data: PreviewData.ringData, colors: PreviewData.ringColors, ringThickness: 15, showLabel: true)
    }
}
