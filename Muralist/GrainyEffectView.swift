//
//  GrainyEffectView.swift
//  Muralist
//
//  Created by Rohit Sharma on 27/12/23.
//

import SwiftUI

struct GrainyEffectView: View {
    let opacity: Double
    let size: CGFloat
    var body: some View {
        // Create a random noise pattern
        Canvas { context, size in
            for _ in 0...(Int(size.width * size.height) / 100) {
                // Draw the random grain particles
                let position = CGPoint(x: .random(in: 0...size.width), y: .random(in: 0...size.height))
                let rect = CGRect(origin: position, size: CGSize(width: self.size, height: self.size))
                context.fill(Path(ellipseIn: rect), with: .color(.green))
            }
        }
        .opacity(opacity) // Set the opacity to simulate grainy effect
    }
}

#Preview {
    GrainyEffectView(opacity: 0.9, size: 1)
}
