//
//  GrainyEffectView.swift
//  Muralist
//
//  Created by Rohit Sharma on 27/12/23.
//

import SwiftUI

struct GrainyViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .overlay(
                Canvas { context, size in
                    for _ in 0..<1000 { // Increase the number for more density
                        let x = Double.random(in: 0..<size.width)
                        let y = Double.random(in: 0..<size.height)
                        let rect = CGRect(x: x, y: y, width: 1, height: 1)
                        context.fill(Path(rect), with: .color(.white.opacity(0.5)))
                    }
                }
                .blendMode(.overlay) // Blends the noise with your content
            )
    }
}
