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
    let photoService: PhotoDataService
    @Published var photosPickerItem: PhotosPickerItem? = nil {
        didSet {
            addPhoto(photoPicker: photosPickerItem)
        }
    }
    init(photoService: PhotoDataService) {
        self.photoService = photoService
        predefinedData()
    }
    private func addPhoto(photoPicker: PhotosPickerItem?) {
        guard let photoPicker else {return }
        Task {
            if let data = try? await photoPicker.loadTransferable(type: Data.self) {
                if let newImage = UIImage(data: data) {
                    let photosData = PhotosData(image: newImage, imageID: (photos.last?.imageID ?? 1) + 1)
                    photoService.savePhoto(photo: photosData)
                    await MainActor.run {
                        self.photos.append(photosData)
                    }
                }
            }
        }
        
    }
    func predefinedData() {
        for index in 1..<13 {
            photos.append(PhotosData(image: UIImage(named: String(index))!, imageID: index))
        }
        photos = photos + photoService.loadPhoto()
    }
    
    func deletePhoto(photo: PhotosData) {
        if let index = photos.firstIndex(where: { $0.imageID == photo.imageID }) {
            photos.remove(at: index)
        }
    }
}


struct PhotosData: Hashable {
    var image: UIImage
    var imageID: Int
}
