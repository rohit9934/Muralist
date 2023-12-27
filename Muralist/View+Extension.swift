//
//  View+Extension.swift
//  Muralist
//
//  Created by Rohit Sharma on 27/12/23.
//
import SwiftUI

extension View {
    func asImage() -> UIImage {
        var image: UIImage = UIImage()
        
        // Dispatch to the main thread to perform UI-related tasks
        DispatchQueue.main.sync {
            let controller = UIHostingController(rootView: self)
            
            // Define the frame and layout of the controller's view
            controller.view.frame = CGRect(origin: .zero, size: CGSize(width: 300, height: 600))
            controller.view.layoutIfNeeded()
            
            // Render the view hierarchy as an image
            image = UIGraphicsImageRenderer(size: controller.view.bounds.size).image { _ in
                controller.view.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
            }
        }
        
        return image
    }
}
