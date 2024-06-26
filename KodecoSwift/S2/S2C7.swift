//
//  S2C7.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/8/29.
//

import SwiftUI

struct S2C7: View {
    let items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) {
        ForEach(items, id: \.self) { item in
            Text(item)
              .frame(maxWidth: .infinity)
              .frame(height: 100)
              .background(.blue)
              .foregroundColor(.white)
            }
        }
        .padding()
    }
}

struct S2C7_Previews: PreviewProvider {
    static var previews: some View {
        S2C7()
    }
}
