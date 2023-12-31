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
    @StateObject var photosData = PhotosDataModel(photoService: FilePhotoDataManager())
    init() {
         let appearance = UINavigationBarAppearance()
         appearance.backgroundColor = UIColor.black 
         appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
         UINavigationBar.appearance().standardAppearance = appearance
         UINavigationBar.appearance().compactAppearance = appearance
         UINavigationBar.appearance().scrollEdgeAppearance = appearance
     }
     
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                ScrollView {
                    LazyVGrid(columns: gridItems,spacing: 10) {
                        ForEach(photosData.photos,id: \.self) { num in
                            NavigationLink(destination: ImageGalleryView(selectedImage: num)) {
                                PhotoView(showImage: num, onDeleteTapped: {
                                    withAnimation(.spring(response: 0.5,dampingFraction: 0.5,blendDuration: 0.5)) {
                                        photosData.deletePhoto(photo: num)
                                    }
                                })
                            }
                        }
                    }.padding()
                }
            }.navigationTitle("Muralist")
                .toolbarColorScheme(.dark, for: .navigationBar)
                .toolbarBackground(
                                              Color.black,
                                              for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbar(content: {
                    PhotosPicker(selection: $photosData.photosPickerItem, matching: .images) {
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
