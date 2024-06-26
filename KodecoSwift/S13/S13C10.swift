//
//  S13C10.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/9/14.
//

import SwiftUI

struct S13C10: View {
    
    @GestureState private var rotateAngle = Angle.zero
    @GestureState private var zoomScale = CGFloat(1.0)
    
    var body: some View {
        let rotationGesture = RotationGesture()
            .updating($rotateAngle) { value, state, _ in
                state = value
            }
        let manificationGesture = MagnificationGesture()
            .updating($zoomScale) { value, state, _ in
                state = value
            }
        // 两个手势同时响应, 可以同时旋转和缩放
        let combinedGesture = rotationGesture.simultaneously(with: manificationGesture)
        Image(systemName: "sun.max.fill")
            .resizable()
            .scaledToFit()
            .frame(width: 100)
            .rotationEffect(rotateAngle)
            .scaleEffect(zoomScale)
            .gesture(combinedGesture)
            .foregroundColor(.yellow)
    }
}

struct S13C10_Previews: PreviewProvider {
    static var previews: some View {
        S13C10()
    }
}
