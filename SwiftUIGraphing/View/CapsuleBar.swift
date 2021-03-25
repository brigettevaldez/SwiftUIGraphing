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
    
    var body: some View {
        VStack {
            
           // Text("\(point.value)")
            GeometryReader { geo in
            ZStack(alignment: .bottom) {
                Capsule()
                    .fill(Color.gray)
                    .opacity(0.1)
                Capsule()
                    .fill(capsuleColor)
                    .frame(height: CGFloat(point.value / maxValue) * geo.size.height)
                    .animation(.easeOut(duration: 0.5))
            }
        }
            Text("\(point.description)")
        }
    }
}

struct CapsuleBar_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleBar(point: Point("description", 50.0), maxValue: 100.0, capsuleColor: .blue)
    }
}
