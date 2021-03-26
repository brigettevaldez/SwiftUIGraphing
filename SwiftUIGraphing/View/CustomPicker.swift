//
//  CustomPicker.swift
//  SwiftUIGraphing
//
//  Created by Brigette Valdez on 3/26/21.
//

import SwiftUI

struct CustomPicker: View {
    
    @Binding var selectedTab: Tab
    
    var tabVMs: [PickerLabelViewModel]
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(Colors.platinum)
            HStack {
                ForEach(tabVMs, id: \.self) { tabView in
                    Button(action: {
                        withAnimation {
                            selectedTab = tabView.tag
                        }
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(selectedTab == tabView.tag ? .white : .clear)
                                .padding(.all, 3)
                            Image(tabView.imgName)
                                .resizable()
                                .renderingMode(selectedTab == tabView.tag ? .original : .template)
                                .aspectRatio(contentMode: .fit)
                                .opacity(selectedTab == tabView.tag ? 1.0 : 0.2)
                                .padding(.all, 5)
                        }
                    }).accentColor(Colors.midGrey)
                }
            }
        }.frame(height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct CustomPicker_Previews: PreviewProvider {
    static var previews: some View {
        CustomPicker(selectedTab: .constant(.rings), tabVMs: PreviewData.tabVMs)
    }
}




