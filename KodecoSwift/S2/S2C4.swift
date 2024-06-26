//
//  S2C4.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/8/29.
//

import SwiftUI

struct S2C4: View {
    var body: some View {
        VStack(spacing: 20) {
            
            // 注意顺序
            Text("Circle")
                .frame(width: 200, height: 100)
                .font(.title)
                .padding()
                .background(.orange)
                .foregroundColor(.white)
                .clipShape(Circle())

            Text("Ellipse")
                .frame(width: 200, height: 100)
                .font(.title)
                .padding()
                .background(.green)
                .foregroundColor(.white)
                .clipShape(Ellipse())

            Text("Capsule")
                .frame(width: 200, height: 100)
                .font(.title)
                .padding()
                .background(.purple)
                .foregroundColor(.white)
                .clipShape(Capsule())

            Text("Custom")
                .frame(width: 200, height: 100)
                .font(.title)
                .padding()
                .background(.yellow)
                .foregroundColor(.black)
                .clipShape(CustomShape())
        }
    }
}

struct CustomShape: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    path.move(to: CGPoint(x: rect.midX, y: rect.minY))
    path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
    path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
    path.closeSubpath()
    return path
  }
}

struct S2C4_Previews: PreviewProvider {
    static var previews: some View {
        S2C4()
    }
}
