//
//  PhotosDataModel.swift
//  Muralist
//
//  Created by Rohit Sharma on 29/12/23.
//

import Foundation
import SwiftUI

class PhotosDataModel: ObservableObject {
    @Published var photos: [PhotosData] = []
    init() {
        predefinedData()
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
