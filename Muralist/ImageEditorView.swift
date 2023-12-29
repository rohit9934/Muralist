//
//  ImageEditorView.swift
//  Muralist
//
//  Created by Rohit Sharma on 16/12/23.
//

import SwiftUI
import Photos
struct ImageEditorView: View {
    var imageToEdit: String
    var body: some View {
        ZStack {
            Image(imageToEdit)
                .resizable()
            .scaledToFit()
        }
    }
}

struct ImageGalleryView: View {
    @State var selectedImageIndex: Int // The index of the tapped image
    @State var showEditor: Bool = false
    @State var sliderValue: Double = 100
    @State var verticalChange: Double = 50
    @State var horizontalChange: Double = 50
    @State var downloadView: Bool = false
    @State var bgColor: Color = .black
    @State var quoteText: String = "Enter some Text Here"
    var body: some View {
        ZStack {
            bgColor.overlay(GrainyEffectView(opacity: 0.6, size: 1))
                .ignoresSafeArea()
            TabView(selection: $selectedImageIndex) {
                ForEach(1..<13, id: \.self) { index in
                    VStack {
                        ImageEditorView(imageToEdit: String(index))
                            .tag(index)
                            .clipShape(.rect(cornerRadius: (100 - sliderValue)))
                            .scaleEffect(sliderValue * 0.01)
                            .offset(y: 2 * (verticalChange - 50))
                            .offset(x: 2 * (horizontalChange - 50))
                            .onTapGesture {
                                showEditor.toggle()
                            }
                        if quoteText != "" {
                            Text(quoteText)
                                .font(.custom("GrandHotel-Regular", size: 30))                          .foregroundStyle(.yellow)
                                .scaledToFit()
                                .frame(width: UIScreen.main.bounds.width - 20, height: 40)
                                .offset(y:  (sliderValue - 100))
                        }
                        // Need to add some text here.
                    }
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .sheet(isPresented: $showEditor, content: {
                ImageEditIconsView(sliderValue: $sliderValue, verticalChange: $verticalChange, horizontalChange: $horizontalChange, downloadImage: $downloadView, quote: $quoteText, color: $bgColor)
                    .onChange(of: downloadView, perform: {  newValue in
                        if newValue {
                            PHPhotoLibrary.requestAuthorization { status in
                                if status == .authorized {
                                    let image = self.asImage()
                                    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                                } else {
                                    // Handle the case where the user denies access
                                }
                            }
                            downloadView = false
                        }
                    })
                    .presentationDetents([.height(150)])
            })
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always)) // Enables paging behavior
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        }                .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    // Perform your action here
                }) {
                    Image(systemName: "plus") // Customize with your button's image or text
                }
                
            }
        }.ignoresSafeArea()
        .navigationBarHidden(true) // Optionally hide the navigation bar if present
    }
}
#Preview {
    ImageEditorView(imageToEdit: "1")
}
