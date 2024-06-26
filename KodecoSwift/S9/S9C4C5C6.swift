//
//  S9C4.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/8/31.
//

import SwiftUI

struct Animal: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let description: String
}

struct S9C4C5C6: View {
    let animals = [
      Animal(name: "Coyote", description: "The coyote is a species of canine native to North America..."),
      Animal(name: "Gila Monster", description: "The Gila Monster is a species of venomous lizard native to the southwestern United States..."),
      Animal(name: "Roadrunner", description: "The roadrunner is a fast-running bird found in the southwestern United States and Mexico...")
    ]
    @State private var selectedAnimal: (Animal)? = nil
    // 侧边栏初始时是否展示
    @State private var columnVisibility: NavigationSplitViewVisibility = .doubleColumn
    var body: some View {
        // 或者直接
//        NavigationSplitView(columnVisibility: .constant(.doubleColumn)) {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            List(animals, id: \.name, selection: $selectedAnimal) { animal in
                NavigationLink(animal.name, value: animal)
            }
            .navigationTitle("Arizona Animals")
        } detail: {
            if let selectedAnimal = selectedAnimal {
                DetailView(animal: selectedAnimal)
            } else {
                Text("Select a animal from the list to see its details")
            }
        }
        // 左侧边栏的宽度？？
        .navigationSplitViewColumnWidth(400)
        // 侧边栏和详情页同等重要性，即都可见时所占空间一致
        .navigationSplitViewStyle(.balanced)
    }
}

struct DetailView: View {
    let animal: Animal

    var body: some View {
        VStack {
            Text(animal.name)
                .font(.largeTitle)
            Text(animal.description)
                .font(.body)
        }
        .padding()
        .navigationTitle("Animal Details")
    }
}

struct S9C4C5C6_Previews: PreviewProvider {
    static var previews: some View {
        S9C4C5C6().previewDevice("iPad (10th generation)")
    }
}
