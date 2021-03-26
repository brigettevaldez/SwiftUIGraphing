//
//  PickerLabelView.swift
//  SwiftUIGraphing
//
//  Created by Brigette Valdez on 3/26/21.
//

import SwiftUI

struct PickerLabelViewModel: Hashable {
    
    let imgName: String
    let tag: Tab
    let id: String = UUID().uuidString
    
    static func == (lhs: PickerLabelViewModel, rhs: PickerLabelViewModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}
