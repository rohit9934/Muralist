//
//  PhotosDataModel.swift
//  Muralist
//
//  Created by Rohit Sharma on 29/12/23.
//

import Foundation
import SwiftUI
import _PhotosUI_SwiftUI

class PhotosDataModel: ObservableObject {
    @Published var photos: [PhotosData] = []
    @Published var photosPickerItem: PhotosPickerItem? = nil {
        didSet {
            addPhoto(photoPicker: photosPickerItem)
        }
    }
    init() {
        predefinedData()
    }
    private func addPhoto(photoPicker: PhotosPickerItem?) {
        guard let photoPicker else {return }
        Task {
            if let data = try? await photoPicker.loadTransferable(type: Data.self) {
                if let newImage = UIImage(data: data) {
                    await MainActor.run {
                        self.photos.append(PhotosData(image: newImage, imageID: (photos.last?.imageID ?? 1) + 1))
                    }
                }
            }
        }
        
    }
    func predefinedData() {
        for index in 1..<13 {
            photos.append(PhotosData(image: UIImage(named: String(index))!, imageID: index))
        }
    }
}


struct PhotosData: Hashable {
    var image: UIImage
    var imageID: Int
}
