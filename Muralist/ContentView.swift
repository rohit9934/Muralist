//
//  ContentView.swift
//  Muralist
//
//  Created by Rohit Sharma on 16/12/23.
//

import SwiftUI

struct ContentView: View {
    let gridItems = [GridItem(.flexible()),  GridItem(.flexible())]
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                ScrollView {
                    LazyVGrid(columns: gridItems,spacing: 10) {
                        ForEach(1..<13,id: \.self) { num in
                            NavigationLink(destination: ImageGalleryView(selectedImageIndex: num)) {
                                PhotoView(imageID: String(num))
                            }
                        }
                    }.padding()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
