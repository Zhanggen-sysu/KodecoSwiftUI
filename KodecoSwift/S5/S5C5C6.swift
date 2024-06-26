//
//  S5C5.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/8/29.
//

import SwiftUI

struct StarShape: Shape {
    let points: Int
    let smoothness: CGFloat

    func path(in rect: CGRect) -> Path {
        assert(points >= 2, "A star must have at least 2 points")

        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let outerRadius = min(rect.width, rect.height) / 2
        let innerRadius = outerRadius * smoothness

        let path = Path { path in
            let angleIncrement = .pi * 2 / CGFloat(points)
            let rotationOffset = CGFloat.pi / 2

            for point in 0..<points {
                let angle = angleIncrement * CGFloat(point) - rotationOffset
                let tippedAngle = angle + angleIncrement / 2

                let outerPoint = CGPoint(x: center.x + cos(angle) * outerRadius, y: center.y + sin(angle) * outerRadius)
                let innerPoint = CGPoint(x: center.x + cos(tippedAngle) * innerRadius, y: center.y + sin(tippedAngle) * innerRadius)

                if point == 0 {
                    path.move(to: outerPoint)
                } else {
                    path.addLine(to: outerPoint)
                }

                path.addLine(to: innerPoint)
            }

            path.closeSubpath()
        }
        return path
    }
}

struct S5C5C6: View {
    var body: some View {
        VStack(spacing: 15) {
            Image("TwoCapybaras")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(StarShape(points: 5, smoothness: 0.4))
            Image("CoolCat")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .shadow(color: .gray, radius: 20, x: 0, y: 2)
        }
        
    }
}

struct S5C5C6_Previews: PreviewProvider {
    static var previews: some View {
        S5C5C6()
    }
}
