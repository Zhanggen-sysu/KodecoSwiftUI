//
//  S2C9.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/8/29.
//

import SwiftUI

struct DiamondShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)

        path.move(to: CGPoint(x: center.x, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: center.y))
        path.addLine(to: CGPoint(x: center.x, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: center.y))
        path.addLine(to: CGPoint(x: center.x, y: 0))

        return path
    }
}

struct S2C9: View {
    var body: some View {
        DiamondShape()
              .fill(Color.red)
              .frame(width: 200, height: 200)
    }
}

struct S2C9_Previews: PreviewProvider {
    static var previews: some View {
        S2C9()
    }
}
