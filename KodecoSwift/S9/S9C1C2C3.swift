//
//  S9C1C2.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/8/31.
//

import SwiftUI

struct S9C1C2C3: View {
    
    @State private var selectedTab: Int = 2
    var body: some View {
        TabView(selection: $selectedTab) {
            Text("First Tab")
                .tabItem {
                    Image("HappySun")
                    Text("First")
                }
                .tag(1) // 这个tag就是selectedTab要选中当前tab所需要赋的值
                .toolbarBackground(.hidden, for: .tabBar)
            
            Text("Second Tab")
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Second")
                }
                .tag(2)
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(Color.orange.opacity(0.8), for: .tabBar)
            
            Text("Third Tab")
                .tabItem {
                    Image("HappyMoon")
                    Text("Third")
                }
                .tag(3)
        }
    }
}

struct S9C1C2C3_Previews: PreviewProvider {
    static var previews: some View {
        S9C1C2C3()
    }
}
