//
//  ImageEditorView.swift
//  Muralist
//
//  Created by Rohit Sharma on 16/12/23.
//

import SwiftUI

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

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            TabView(selection: $selectedImageIndex) {
                ForEach(1..<12, id: \.self) { index in
                    ImageEditorView(imageToEdit: String(index))
                        .tag(index) // Tag each page with its index
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always)) // Enables paging behavior
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        }
        //.navigationBarHidden(true) // Optionally hide the navigation bar if present
    }
}
struct ColorView: View {
    let color: Color
    
    var body: some View {
        Rectangle()
            .foregroundColor(color)
            // Use `.ignoresSafeArea()` if you want the color to extend to the edges of the display.
    }
}

// An example array of colors to be displayed in each page of the TabView
let colors: [Color] = [.red, .green, .blue, .orange, .pink]

#Preview {
    ImageEditorView(imageToEdit: "1")
}
