//
//  CapsuleLabel.swift
//  SwiftUIGraphing
//
//  Created by Brigette Valdez on 3/25/21.
//

import SwiftUI

struct CapsuleLabel: View {
    var point: Point
    var textColor: Color = .black
    
    var body: some View {
            Text(point.description)
                .font(.boldFourteen)
                .lineLimit(1)
                .rotationEffect(Angle(degrees: 40.0))
    }
}

struct CapsuleLabel_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleLabel(point: Point("2017 Q3", 15.5))
    }
}
