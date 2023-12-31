//
//  PhotoDataManager.swift
//  Muralist
//
//  Created by Rohit Sharma on 31/12/23.
//

import Foundation
import UIKit

protocol PhotoDataService {
    func savePhoto(photo: PhotosData)
    func loadPhoto() -> [PhotosData]
}

class FilePhotoDataManager: PhotoDataService {
    func savePhoto(photo: PhotosData) {
        let image = photo.image
        if let data = image.jpegData(compressionQuality: 1) ?? image.pngData() {
            let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let fileURL = documentsDirectory.appendingPathComponent(String(photo.imageID))
            
            if !FileManager.default.fileExists(atPath: fileURL.path) {
                do {
                    try data.write(to: fileURL)
                    print("Image saved: \(fileURL.absoluteString)")
                } catch {
                    print("Error saving image: \(error)")
                }
            }
        }
    }
    
    func loadPhoto() -> [PhotosData] {
        let fileManager = FileManager.default
        let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        var images = [PhotosData]()
        
        do {
            let fileURLs = try fileManager.contentsOfDirectory(at: documentsDirectory, includingPropertiesForKeys: nil)
            
            for fileURL in fileURLs {
                if let image = UIImage(contentsOfFile: fileURL.path) {
                    if let name = fileURL.lastPathComponent.split(separator: ".").first {
                        images.append(PhotosData(image: image, imageID: Int(name) ?? 0))
                    }
                }
            }
        } catch {
            print("Error loading images from disk: \(error)")
        }
        
        return images
    }
    

    
}
