//
//  ColorExtension.swift
//  SwiftUIGraphing
//
//  Created by Brigette Valdez on 3/25/21.
//

import Foundation
import SwiftUI

extension Color {
    init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (r, g, b) = ((int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (r, g, b) = (int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (r, g, b) = (int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (r, g, b) = (0, 0, 0)
        }
        self.init(red: Double(r) / 255, green: Double(g) / 255, blue: Double(b) / 255)
    }
}

public struct Colors {
    public static let honeydew:Color = Color(hexString: "#E2FAE7")
    public static let emerald:Color = Color(hexString: "#72BF82")

    public static let midGrey: Color = Color(hexString: "6E7076")
    public static let platinum: Color = Color(hexString: "EAEAEC")
}

public struct GradientColor {
    public let start: Color
    public let end: Color
    
    public init(start: Color, end: Color) {
        self.start = start
        self.end = end
    }
    
    public func getGradient() -> Gradient {
        return Gradient(colors: [start, end])
    }
}



public struct RingColorSets {
    static let yellow =  RingColors(background: Color(hexString: "FFEEC0"), start: Color(hexString: "FFCC41"), end: Color(hexString:"FFBE0A"))
    static let blue = RingColors(background: Color(hexString: "7FE3F0"), start: Color(hexString: "28B0C1"), end: Color(hexString: "1F8A98"))
    static let orngPink = RingColors(background: Color(hexString: "FFB9AB"), start: Color(hexString: "ff6f52"), end: Color(hexString: "FF441F"))
    static let prplBlue = RingColors(background: Color(hexString: "CDB8FF"), start: Color(hexString: "8C80F8"), end: Color(hexString: "6151F6"))
    static let green = RingColors(background: Color(hexString: "E2FAE7"), start: Color(hexString: "6AC87E"), end: Color(hexString: "3FAA57"))
}
