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
    @StateObject var photosData = PhotosDataModel()
    init() {
         let appearance = UINavigationBarAppearance()
         appearance.backgroundColor = UIColor.black // Your desired background color
         appearance.titleTextAttributes = [.foregroundColor: UIColor.white] // Your desired title color
         
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
                                PhotoView(showImage: num.image)
                            }
                        }
                    }.padding()
                }
            }.navigationTitle("Muralist")
                .tint(.red)
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
