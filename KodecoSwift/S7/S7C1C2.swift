//
//  S7C1.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/8/29.
//

import SwiftUI

struct ScientistDetailView: View {
    let name: String

    var body: some View {
        VStack {
            Text(name)
                .font(.title)
                .padding()
            Text("More details about \(name) would be presented here.")
                .font(.body)
                .foregroundColor(.gray)
        }
        .navigationTitle(name)
    }
}

struct S7C1C2: View {
    let scientists = ["Albert Einstein", "Isaac Newton", "Marie Curie", "Charles Darwin", "Nikola Tesla"]
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Text("Item 1")
                    Text("Item 2")
                    Text("Item 3")
                }
                // ForEach 隐式使用
                List(scientists, id: \.self) { scientist in
                    // 跳转样式，右边有箭头
                    // 第一个参数是列表的title，第二个参数是传到下一页的数据
                    NavigationLink(scientist, value: scientist)
                }.navigationDestination(for: String.self) { scientistName in
                    ScientistDetailView(name: scientistName)
                }
                // ForEach 显示使用
                List {
                    ForEach(scientists, id: \.self) { scientist in
                        Text(scientist)
                            .listRowBackground( // 设置cell背景样式
                                LinearGradient(gradient: Gradient(colors: [.blue, .purple]),
                                                         startPoint: .leading,
                                                         endPoint: .trailing)
                            )
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

struct S7C1C2_Previews: PreviewProvider {
    static var previews: some View {
        S7C1C2()
    }
}
