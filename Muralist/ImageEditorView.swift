//
//  ImageEditorView.swift
//  Muralist
//
//  Created by Rohit Sharma on 16/12/23.
//

import SwiftUI
import Photos
struct ImageEditorView: View {
    var imageToEdit: UIImage
    var body: some View {
        ZStack {
            Image(uiImage: imageToEdit)
                .resizable()
            .scaledToFit()
        }
    }
}

struct ImageGalleryView: View {
    @State var selectedImage: PhotosData // The index of the tapped image
    @State var showEditor: Bool = false
    @State var sliderValue: Double = 100
    @State var verticalChange: Double = 50
    @State var horizontalChange: Double = 50
    @State var downloadView: Bool = false
    @State var bgColor: Color = .black
    @State var quoteText: String = "Enter some Text Here"
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            bgColor.grainyEffect()
                .ignoresSafeArea()
            VStack {
                ImageEditorView(imageToEdit:selectedImage.image)
                    .tag(selectedImage.imageID)
                    .clipShape(.rect(cornerRadius: (100 - sliderValue)))
                //       .border(.white, width: 10)
                    .scaleEffect(sliderValue * 0.01)
                    .offset(y: 2 * (verticalChange - 50))
                    .offset(x: 2 * (horizontalChange - 50))
                    .onTapGesture {
                        showEditor.toggle()
                    }
                if quoteText != "" {
                    Text(quoteText)
                        .font(.custom("GrandHotel-Regular", size: 30))                          .foregroundStyle(.yellow)
                        .lineLimit(nil)
                        .multilineTextAlignment(.center)
                        .frame(width: UIScreen.main.bounds.width - 20)
                        .offset(y:  2 * (sliderValue - 100))
                }
                // Need to add some text here.
            }
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
                     
                }) {
                    Image(systemName: "plus")
                }
                
            }
        }.ignoresSafeArea()
        .navigationBarHidden(true)
        .gesture(DragGesture().onChanged { value in
            // Check for a horizontal swipe to the right, and the swipe is from the edge.
            if value.startLocation.x < 20 && value.translation.width > 100 {
                self.presentationMode.wrappedValue.dismiss()
            }
        })
    // Optionally hide the navigation bar if present
    }
}
#Preview {
  //  ImageEditorView(imageToEdit: UIImage(named: "1")!)
    ImageGalleryView(selectedImage: PhotosData(image: UIImage(named: "1")!, imageID: 1))
}
