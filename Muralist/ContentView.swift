//
//  ContentView.swift
//  Muralist
//
//  Created by Rohit Sharma on 16/12/23.
//

import SwiftUI
import PhotosUI
struct ContentView: View {
    let gridItems = [GridItem(.flexible()),  GridItem(.flexible())]
    @State private var addedImage: PhotosPickerItem? = nil
    var photosData = PhotosDataModel()
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                ScrollView {
                    LazyVGrid(columns: gridItems,spacing: 10) {
                        ForEach(photosData.photos,id: \.self) { num in
                            NavigationLink(destination: ImageGalleryView(selectedImage: num)) {
                                PhotoView(showImage: num.image)
                            }
                        }
                    }.padding()
                }
            }.navigationTitle("Muralist")
                .toolbar(content: {
                    PhotosPicker(selection: $addedImage, matching: .images) {
                        Image(systemName: "plus")
                    }
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
