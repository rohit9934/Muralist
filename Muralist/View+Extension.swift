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
            let screenSize = UIScreen.main.bounds.size
            
            // Set the frame of the controller's view to match the screen size
            controller.view.frame = CGRect(origin: .zero, size: screenSize)
            controller.view.layoutIfNeeded()
            
            // Render the view hierarchy as an image
            image = UIGraphicsImageRenderer(size: controller.view.bounds.size).image { _ in
                controller.view.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
            }
        }
        
        return image
    }
}
