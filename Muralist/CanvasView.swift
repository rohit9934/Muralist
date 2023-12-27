//
//  CanvasView.swift
//  Muralist
//
//  Created by Rohit Sharma on 16/12/23.
//

import SwiftUI

struct CanvasView: View {
    var body: some View {
        ZStack {
            Color.pink.ignoresSafeArea()
            VStack {
                Spacer()
                HStack {
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 60, height: 200)
                        .clipShape(.rect(topTrailingRadius: 30))
                    Spacer()
                }
            }.ignoresSafeArea()
            
        }
    }
}

#Preview {
    CanvasView()
}
