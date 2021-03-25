//
//  CapsuleBarGraph.swift
//  SwiftUIGraphing
//
//  Created by Brigette Valdez on 3/25/21.
//

import SwiftUI

struct CapsuleBarGraph: View {
    
    @ObservedObject var viewModel: CapsuleBarGraphViewModel
    
    var body: some View {
        graph
    }
    
    var graph: some View {
        HStack {
            ForEach(viewModel.data.points, id: \.self) { point in
                CapsuleBar(point: point, maxValue: viewModel.maxValue, capsuleColor: viewModel.graphColor)
            }
        }
    }
}

struct CapsuleBarGraph_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleBarGraph(viewModel: PreviewData.barGraphVM)
    }
}
