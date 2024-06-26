//
//  S11C8.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/9/7.
//

import SwiftUI

// 自定义
struct CircleAlignment: AlignmentID {
    static func defaultValue(in d: ViewDimensions) -> CGFloat {
        return d[VerticalAlignment.center]
    }
}


extension VerticalAlignment {
    static let circleAlignment = VerticalAlignment(CircleAlignment.self)
}

struct S11C8C9: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Padding and Spacing")
                .font(.largeTitle)
                .padding(.bottom, 20)
            HStack(spacing: 15) {
                Image(systemName: "hare.fill")
                    .font(.largeTitle)
                    .foregroundStyle(.green)
                    .padding()
                    .background(.orange.opacity(0.2))
                    .clipShape(Circle())
                
                Image(systemName: "tortoise.fill")
                    .font(.largeTitle)
                    .foregroundColor(.green)
                    .padding()
                    .background(.orange.opacity(0.2))
                    .clipShape(Circle())
            }
            Text("It's not about speed, it's about comfort!")
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(.orange.opacity(0.2))
                .cornerRadius(10)
            HStack(alignment: .circleAlignment) {
                ForEach(0..<5) { index in
                    Circle()
                        .frame(width: 50, height: 50)
                        .alignmentGuide(.circleAlignment) { _ in
                            CGFloat(index * 20)
                        }
                }
            }
            .frame(height: 200)
            .border(.black, width: 1)
        }
        .padding()
    }
}

struct S11C8C9_Previews: PreviewProvider {
    static var previews: some View {
        S11C8C9()
    }
}
