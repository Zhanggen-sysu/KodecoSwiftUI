//
//  S3C6.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/8/29.
//

import SwiftUI

struct S3C6: View {
    @AppStorage("username") var username: String = "Anonymous"
    @SceneStorage("selectedTab") var selectedTab: String?

    var body: some View {
        
        TabView(selection: $selectedTab) {
            // Tab样式，.tabItem设置tabIcon
            VStack {
                Text("Welcome, \(username)!")

                Button("Log in") {
                    username = "SuzGupta"
                }
            }.tabItem {
                Label("Tab 1", systemImage: "1.circle")
            }
            .tag("Tab1")

            Text("Tab 2")
                .tabItem {
                    Label("Tab 2", systemImage: "2.circle")
                }
                .tag("Tab2")
        }
        
    }
}

struct S3C6_Previews: PreviewProvider {
    static var previews: some View {
        S3C6()
    }
}
