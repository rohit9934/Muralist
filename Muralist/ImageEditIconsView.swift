//
//  ImageEditIconsView.swift
//  Muralist
//
//  Created by Rohit Sharma on 16/12/23.
//

import SwiftUI

struct ImageEditIconsView: View {
    @Binding var sliderValue: Double
    @State private var showSlider: Bool = false
    @State private var scale: CGFloat = 1.0
    var body: some View {
        Color.green.ignoresSafeArea()
        Slider(
                    value: $sliderValue,
                    in: 0...100,
                    step: 1 // Define the range of the slider
        ).tint(.green)
            .background(.red)
            .onChange(of: sliderValue) { newValue in
                 print(sliderValue)
            }
    }
}

#Preview {
    ImageEditIconsView(sliderValue: .constant(40))
        .previewLayout(.fixed(width: 60, height: 100))
}
