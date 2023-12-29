//
//  PhotoView.swift
//  Muralist
//
//  Created by Rohit Sharma on 16/12/23.
//

import SwiftUI

struct PhotoView: View {
    var showImage: UIImage
    var body: some View {
        Image(uiImage: showImage)
            .resizable()
            .scaledToFill()
            .frame(width: 175,height: 175)
            .clipped()
            .clipShape(.rect(cornerRadius: 20))
    }
}

#Preview {
    PhotoView(showImage: UIImage(named: "1")!)
        .previewLayout(.fixed(width: 175, height: 175))
}
