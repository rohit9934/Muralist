//
//  ImageEditIconsView.swift
//  Muralist
//
//  Created by Rohit Sharma on 16/12/23.
//

import SwiftUI

struct ImageEditIconsView: View {
    @Binding var sliderValue: Double
    @Binding var verticalChange: Double
    @Binding var horizontalChange: Double
    @State private var showSlider: Bool = false
    @State private var scale: CGFloat = 1.0
    var body: some View {
        Color.green.ignoresSafeArea()
        VStack {
            Slider(
                        value: $sliderValue,
                        in: 0...100,
                        step: 1 // Define the range of the slider
            ).tint(.green)
                .background(.red)
                .onChange(of: sliderValue) { newValue in
                     print(sliderValue)
            }
            Slider(
                        value: $verticalChange,
                        in: 0...100,
                        step: 1 // Define the range of the slider
            ).tint(.black)
                .background(.red)
                .onChange(of: verticalChange) { newValue in
                     print(verticalChange)
            }
            Slider(
                        value: $horizontalChange,
                        in: 0...100,
                        step: 1 // Define the range of the slider
            ).tint(.black)
                .background(.yellow)
                .onChange(of: horizontalChange) { newValue in
                     print(horizontalChange)
            }
        }
    }
}

#Preview {
    ImageEditIconsView(sliderValue: .constant(40), verticalChange: .constant(10), horizontalChange: .constant(50))
        .previewLayout(.fixed(width: 60, height: 100))
}
