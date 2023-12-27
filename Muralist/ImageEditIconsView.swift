//
//  ImageEditIconsView.swift
//  Muralist
//
//  Created by Rohit Sharma on 16/12/23.
//

import SwiftUI

struct ImageEditIconsView: View {
    @State private var sliderValue: Double = 50
    @State private var showSlider: Bool = false
    @State private var scale: CGFloat = 1.0
    var body: some View {
        Color.green.ignoresSafeArea()
        Slider(
                    value: $scale,
                    in: 0...100,
                    step: 1 // Define the range of the slider
        ).tint(.green)
            .background(.red)
    }
}

#Preview {
    ImageEditIconsView()
        .previewLayout(.fixed(width: 60, height: 100))
}
