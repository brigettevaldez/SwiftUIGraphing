//
//  CapsuleBar.swift
//  SwiftUIGraphing
//
//  Created by Brigette Valdez on 3/25/21.
//

import SwiftUI

struct CapsuleBar: View {
    var point: Point
    var maxValue: Double
    var capsuleColor: Color
    var labelView: AnyView?
    @State var fillPercentage: CGFloat = 0
    
    var body: some View {
        VStack {
            GeometryReader { geo in
                ZStack(alignment: .bottom) {
                    Capsule()
                        .fill(Color.gray)
                        .opacity(0.1)
                    Capsule()
                        .fill(capsuleColor)
                        .frame(height: CGFloat(point.value / maxValue) * geo.size.height * fillPercentage)
                        .animation(.easeOut(duration: 0.5))
                        .onAppear(perform: {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                fillPercentage = 1.0
                            }
                        })
                }
            }
        }
    }
    
}


struct CapsuleBar_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleBar(point: Point("description", 50.0), maxValue: 100.0, capsuleColor: .blue, labelView: AnyView(CapsuleLabel(point: Point("Q1 2014", 50.0))))
    }
}
