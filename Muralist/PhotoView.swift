//
//  PhotoView.swift
//  Muralist
//
//  Created by Rohit Sharma on 16/12/23.
//

import SwiftUI

struct PhotoView: View {
    var showImage: PhotosData
    @State private var showAlert = false
    let onDeleteTapped: () -> Void
    var body: some View {
        
        Image(uiImage: showImage.image)
            .resizable()
            .scaledToFill()
            .frame(width: 175,height: 175)
            .clipped()
            .clipShape(.rect(cornerRadius: 20))
            .contextMenu {
                Button(action: {
                    showAlert = true
                }) {
                    Text("Delete")
                    Image(systemName: "trash")
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Delete Image"),
                    message: Text("Are you sure you want to delete this image?"),
                    primaryButton: .destructive(Text("Delete")) {
                        onDeleteTapped()
                    },
                    secondaryButton: .cancel()
                )
            }
    }
}

#Preview {
    PhotoView(showImage: PhotosData(image: UIImage(named: "1")!, imageID: 1), onDeleteTapped: {} )
        .previewLayout(.fixed(width: 175, height: 175))
}
