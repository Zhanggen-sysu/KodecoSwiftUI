//
//  S11C7.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/9/7.
//

import SwiftUI

struct S11C7: View {
    var body: some View {
        // 在block里获取父view的frame
        GeometryReader { geometry in
            VStack {
                ForEach(0..<10) { i in
                    Rectangle()
                        .fill(.blue)
                        .frame(width: geometry.size.width * CGFloat(i + 1)/10)
                }
            }
        }
    }
}

struct S11C7_Previews: PreviewProvider {
    static var previews: some View {
        S11C7()
    }
}
