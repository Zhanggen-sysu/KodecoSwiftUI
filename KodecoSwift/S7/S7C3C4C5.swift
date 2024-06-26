//
//  S7C3.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/8/29.
//

import SwiftUI

struct Park: Hashable {
    let name: String
    let imageName: String
    let description: String
}

extension Park: Identifiable {
    var id: String { name }
}

struct ParkDetailsView: View {
    let park: Park

    var body: some View {
        VStack {
            Image(park.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
            Text(park.name)
                .font(.title)
                .foregroundColor(.primary)
            Text(park.description)
                .font(.body)
                .foregroundColor(.secondary)
        }
        .navigationTitle(park.name)
        .padding()
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "gear")
                }

            }
        }
    }
}

struct S7C3C4C5: View {
    @State private var presentedParks: [Park] = []

    var parks: [Park] {
        [
            Park(name: "Yosemite", imageName: "yosemite", description: "Yosemite National Park"),
            Park(name: "Sequoia", imageName: "sequoia", description: "Sequoia National Park"),
            Park(name: "Point Reyes", imageName: "point_reyes", description: "Point Reyes National Seashore")
        ]
    }

    var body: some View {
        // 这个path是初始的Stack深度，比如presentedParks如果不是空，则初始会处于跳转了的页面，页面样式和presentedParks元素对应，presentedParks有几个元素，就需要back几个页面才能回到list页面
        NavigationStack(path: $presentedParks) {
            List(parks) { park in
                NavigationLink(park.name, value: park)
            }
            .navigationDestination(for: Park.self) { park in
                ParkDetailsView(park: park)
            }
        }
    }
}

struct S7C3C4C5_Previews: PreviewProvider {
    static var previews: some View {
        S7C3C4C5()
    }
}
