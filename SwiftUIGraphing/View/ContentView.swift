//
//  ContentView.swift
//  SwiftUIGraphing
//
//  Created by Brigette Valdez on 3/25/21.
//

import SwiftUI

enum Tab {
    case rings
    case capsule
}

struct ContentView: View {
    
    @State private var selectedTab: Tab = .capsule
    
    var animation: Animation {
        return Animation.easeIn(duration: 2.0)
    }
    
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 50)
            CustomPicker(selectedTab: $selectedTab, tabVMs: PreviewData.tabVMs)
            .padding(.top, 30)
            .padding([.leading, .trailing], 50)
            graphView
        }.padding([.leading, .trailing], 20)
        .padding(.top, 15)
    }
    
    var graphView: some View {
        switch selectedTab {
        case .rings:
            return AnyView(RingGraph(vm: PreviewData.ringGraphVM, ringThickness: 15, centerSpace: 50.0))
                .transition(AnyTransition.slide)
        case .capsule:
            return AnyView(CapsuleBarGraph(viewModel: PreviewData.barGraphVM))
                .transition(AnyTransition.slide)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
