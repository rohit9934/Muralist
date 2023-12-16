//
//  PhotoView.swift
//  Muralist
//
//  Created by Rohit Sharma on 16/12/23.
//

import SwiftUI

struct PhotoView: View {
    var imageID: String
    var body: some View {
        Image(imageID)
            .resizable()
            .scaledToFill()
            .frame(width: 175,height: 175)
            .clipped()
            .clipShape(.rect(cornerRadius: 20))
    }
}

#Preview {
    PhotoView(imageID: "1")
        .previewLayout(.fixed(width: 175, height: 175))
}
