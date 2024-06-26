//
//  S9C7.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/8/31.
//

import SwiftUI

struct S9C7C8C9C10: View {
    @State private var isPresented = false
    @State private var selectedTab: Int = 1
    @State private var isTabViewHide: Bool = false

    var body: some View {
        // 与NavigationStack嵌套使用
        NavigationStack {
            VStack {
                Button("Switch tab") {
                    // 手动切换tab
                    selectedTab = selectedTab == 1 ? 2 : 1
                }.padding()
                
                Button(isTabViewHide ? "Show tabview" : "Hide tabview") {
                    isTabViewHide.toggle()
                }.padding()
                
                // 控制tabview显示隐藏
                if !isTabViewHide {
                    TabView(selection: $selectedTab) {
                        Text("First Tab")
                            .tabItem {
                                Image(systemName: "1.circle")
                                Text("Tab 1")
                            }
                            .tag(1)

                        Text("Second Tab")
                            .tabItem {
                                Image(systemName: "2.circle")
                                Text("Tab 2")
                            }
                            .tag(2)
                    }
                    // 监控selectedTab变化，改变时展示ModalView
                    .onChange(of: selectedTab) { _ in
                        isPresented = true
                    }
                    .sheet(isPresented: $isPresented) {
                        ModalView(isPresented: self.$isPresented)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            .navigationTitle("My App")
        }
        
    }
}

struct ModalView: View {
    @Binding var isPresented: Bool

    var body: some View {
        Text("This is a modal view.")
            .padding()
        Button("Dismiss") {
            isPresented = false
        }
    }
}

struct S9C7C8C9C10_Previews: PreviewProvider {
    static var previews: some View {
        S9C7C8C9C10()
    }
}
