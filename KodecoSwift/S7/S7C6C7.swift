//
//  S7C6.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/8/30.
//

import SwiftUI

// Identifiable 用来唯一标识元素，帮助识别状态变化中的view
struct Item : Identifiable {
    let id = UUID()
    let name : String
}

struct S7C6C7: View {
    // 字典
    let sectionsAndItems: [String: [Item]] = [
        "Section 1": [
            Item(name: "Item1"),
            Item(name: "Item2")
        ],
        "Section 2": [
            Item(name: "Item3"),
            Item(name: "Item4")
        ]
    ]
    @State private var searchText = ""
    var body: some View {
        NavigationStack {
            // 先把keys转换成数组
            List(Array(sectionsAndItems.keys), id: \.self) { section in
                Section(section) {
                    // 注意用法，filter是在括号里面的
                    ForEach((sectionsAndItems[section] ?? []).filter { searchText.isEmpty || $0.name.localizedCaseInsensitiveContains(searchText)}) { item in
                        Text(item.name)
                    }
                }
            }
            .navigationTitle("My List")
            .searchable(text: $searchText)
        }
    }
}

struct S7C6C7_Previews: PreviewProvider {
    static var previews: some View {
        S7C6C7()
    }
}
