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
            Color.black.ignoresSafeArea()
            Image(imageToEdit)
                .resizable()
            .scaledToFit()
        }
    }
}

#Preview {
    ImageEditorView(imageToEdit: "1")
}
