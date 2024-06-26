//
//  S11C3.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/9/7.
//

import SwiftUI

struct S11C3: View {
    var body: some View {
        let columns = [
            // 用来定义每行/每列个数，以及布局（fix, flexible, adaptive）
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
        let rows = [
            GridItem(.fixed(100)),
            GridItem(.flexible())
        ]
        
        VStack(spacing: 100) {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(0..<6) { index in
                    Text("Item \(index)")
                        .padding()
                        .background(.blue)
                        .cornerRadius(10)
                }
            }
            
            LazyHGrid(rows: rows, spacing: 20) {
                ForEach(0..<6) { index in
                    Text("Item \(index)")
                        .padding()
                        .background(.blue)
                        .cornerRadius(10)
                }
            }
        }
        
    }
}

struct S11C3_Previews: PreviewProvider {
    static var previews: some View {
        S11C3()
    }
}
