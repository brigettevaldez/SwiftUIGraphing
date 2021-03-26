//
//  CapsuleBarGraph.swift
//  SwiftUIGraphing
//
//  Created by Brigette Valdez on 3/25/21.
//

import SwiftUI

struct CapsuleBarGraph: View {
    
    @ObservedObject var viewModel: CapsuleBarGraphViewModel
    var spacing: CGFloat
    
    init(viewModel: CapsuleBarGraphViewModel, spacing: CGFloat = 10) {
        self.viewModel = viewModel
        self.spacing = spacing
    }
    var body: some View {
        VStack {
            Text("Capsule bar Graph")
                .font(.medFourteen)
        graph
            .padding([.leading, .trailing], 30)
        }.padding(.top, 15)
    }
    
    var graph: some View {
        HStack(spacing: spacing) {
            ForEach(viewModel.data.points, id: \.self) { point in
                CapsuleBar(point: point, maxValue: viewModel.maxValue, capsuleColor: viewModel.graphColor, labelView: AnyView(CapsuleLabel(point: point)))
                    
            }
        }
    }
}

struct CapsuleBarGraph_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleBarGraph(viewModel: PreviewData.barGraphVM, spacing: 10)
    }
}
