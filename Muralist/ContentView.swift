//
//  ContentView.swift
//  Muralist
//
//  Created by Rohit Sharma on 16/12/23.
//

import SwiftUI

struct ContentView: View {
    let gridItems = [GridItem(.flexible()),  GridItem(.flexible())]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItems,spacing: 10) {
                ForEach(1..<12,id: \.self) { num in
                    PhotoView(imageID: String(num))
                }
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
