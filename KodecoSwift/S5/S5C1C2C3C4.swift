//
//  S5C1.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/8/29.
//

import SwiftUI

struct S5C1C2C3C4: View {
    var body: some View {
        
        TabView {
            Image("HedgehogInClover")
                .resizable()
                .aspectRatio(2, contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
                .tabItem {
                    Label("Image Scale", systemImage: "person").symbolVariant(.none)
                }
            VStack {
                HStack(spacing: 16) {
                    // This renders a bell icon with a slash through it
                    Image(systemName: "bell")
                      .symbolVariant(.slash)

                    // This surrounds the bell with a square
                    Image(systemName: "bell")
                      .symbolVariant(.square)

                    // This renders a bell icon with a slash through it and fills it
                    Image(systemName: "bell")
                      .symbolVariant(.fill.slash)
                }
                HStack {
                    Image(systemName: "pawprint.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                    Text("Cropping With Clipped")
                        .font(.title)
                }
                Image("WinterPup") // Load the image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200) // Set the frame size
                    .clipped() // Crop the image to the frame size
                    .border(.black, width: 2) // Add a border for visual clarity
            }.tabItem {
                Label("SF Symbol", systemImage: "bell")
                  .symbolVariant(.none)
            }
        }
    }
}

struct S5C1C2C3C4_Previews: PreviewProvider {
    static var previews: some View {
        S5C1C2C3C4()
    }
}
