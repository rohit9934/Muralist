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
    @Binding var downloadImage: Bool
    @State private var showSlider: Bool = false
    @State private var scale: CGFloat = 1.0
    @Binding var quote: String
    @Binding var bgColor: Color
    @Binding var textColor: Color
    @State private var showColorPicker: Bool = false
    @State private var showTextColorPicker: Bool = false
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
            Button(action: {
                downloadImage = true
            }, label: {
                Text("Save Wallpaper")
            })
            HStack {
                Circle()
                    .fill(bgColor)
                    .frame(width: 20, height: 20)
                    .onTapGesture {
                        showColorPicker.toggle()
                    }
                Circle()
                    .fill(textColor)
                    .frame(width: 20, height: 20)
                    .onTapGesture {
                        showTextColorPicker.toggle()
                    }
            }
            HStack {
                TextField("Enter some text", text: $quote)
                            .border(Color.gray)
                            .padding(.leading)
            }
            if showColorPicker {
                ColorPicker("Choose your color", selection: $bgColor)
                                   .padding()
            }
            if showTextColorPicker {
                ColorPicker("Choose your color", selection: $textColor)
                                   .padding()
            }
        }
    }
}

#Preview {
    ImageEditIconsView(sliderValue: .constant(40), verticalChange: .constant(10), horizontalChange: .constant(50), downloadImage: .constant(false), quote: .constant("till i love"), bgColor: .constant(.black), textColor: .constant(.blue))
        .previewLayout(.fixed(width: 60, height: 100))
}
