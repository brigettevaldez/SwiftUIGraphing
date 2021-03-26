//
//  RingGraph.swift
//  SwiftUIGraphing
//
//  Created by Brigette Valdez on 3/25/21.
//

import SwiftUI

struct RingGraph: View {
    
    @ObservedObject var viewModel: RingGraphViewModel
    @State var spinPercentage: Double = 0
    
    private var animate: Bool = true
    private var ringThickness: CGFloat
    private var centerSpace: CGFloat
    
    private var animation: Animation {
        Animation.easeInOut(duration: 1)
    }
    
    init(vm: RingGraphViewModel, ringThickness: CGFloat, centerSpace: CGFloat = 50, animate: Bool = true) {
        self.viewModel = vm
        self.ringThickness = ringThickness
        self.centerSpace = centerSpace
        self.animate = animate
    }
   
    var body: some View {
        GeometryReader{ geo in
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                ForEach(viewModel.data.rings) { ring in
                    VStack {
                        RingView(data: ring, colors: PreviewData.randomGradient(), ringThickness: ringThickness, index: getIndex(ring))
                            .frame(width: (geo.size.width - centerSpace) / 2, height: (geo.size.width - centerSpace) / 2)
                            .rotationEffect(Angle(degrees: getAngle(ring)), anchor: .center) //rotate button clockwise so it will be aligned vertically
                            .animation(.easeOut)
                        Spacer()
                    }.frame(width: (geo.size.width - centerSpace) / 2, height: geo.size.width )
                    .rotationEffect(Angle(degrees: getVariableAngle(ring)), anchor: .center)
                    .onAppear(perform: {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            withAnimation(self.animation) {
                                self.spinPercentage = 1.0
                            }
                        }
                    })
                }
            }
        }
    }
    
    func getIndex(_ ring: RingData) -> Double {
        guard let index = viewModel.data.rings.firstIndex(of: ring) else { return 0.0 }
        return Double(index)
    }
    
    func getAngle(_ ring: RingData) -> Double {
        let cnt = Double(viewModel.data.rings.count)
        let angleStride = 360.0 / cnt
        guard let index = viewModel.data.rings.firstIndex(of: ring) else { return 0.0 }
        return angleStride * Double(index) * -1
    }
    
    func getVariableAngle(_ ring: RingData) -> Double {
        let cnt = Double(viewModel.data.rings.count)
        let angleStride = 360.0 / cnt
        guard let index = viewModel.data.rings.firstIndex(of: ring) else { return 0.0 }
        return (angleStride * Double(index) * spinPercentage)
    }


    }


struct RingGraph_Previews: PreviewProvider {
    static var previews: some View {
        RingGraph(vm: PreviewData.ringGraphVM, ringThickness: 7.0, centerSpace: 0)
    }
}
