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
    var body: some View {
        ZStack {
            bgColor.overlay(GrainyEffectView(opacity: 0.6, size: 1))
                .ignoresSafeArea()
            TabView(selection: $selectedImageIndex) {
                ForEach(1..<12, id: \.self) { index in
                    ImageEditorView(imageToEdit: String(index))
                        .tag(index)
                        .clipShape(.rect(cornerRadius: (100 - sliderValue)))
                        .scaleEffect(sliderValue * 0.01)
                        .offset(y: 2 * (verticalChange - 50))
                        .offset(x: 2 * (horizontalChange - 50))
                        .onTapGesture {
                            showEditor.toggle()
                        }
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .sheet(isPresented: $showEditor, content: {
                ImageEditIconsView(sliderValue: $sliderValue, verticalChange: $verticalChange, horizontalChange: $horizontalChange, downloadImage: $downloadView, color: $bgColor)
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
