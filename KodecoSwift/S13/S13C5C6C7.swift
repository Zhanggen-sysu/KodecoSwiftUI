//
//  S13C5.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/9/14.
//

import SwiftUI

struct S13C5C6C7: View {
    
    @State private var angle: Angle = .degrees(0)
    @State private var scale: CGFloat = 1.0
    @State private var position = CGSize.zero
    
    var body: some View {
        
        VStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 100, height: 100)
                .rotationEffect(angle)
                .gesture(
                    // 旋转手势，按住alt/option键，就可以模拟两指手势
                    RotationGesture()
                        .onChanged{ angle in
                            self.angle = angle
                        }
                )
            
            Image(systemName: "star.circle.fill")
                .resizable()
                .scaledToFit()
                .scaleEffect(scale)
                .gesture(
                    // 缩放手势，按住alt/option键，就可以模拟两指手势
                    MagnificationGesture()
                        .onChanged { value in
                            self.scale = value.magnitude
                        }
                )
                .padding()
            // 手势优先级
            Image(systemName: "heart.fill")
                .font(.system(size: 100))
                .foregroundColor(.red)
                .padding()
                .offset(position)
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            self.position = gesture.translation
                        }
                        .onEnded { _ in
                            print("Drag ended")
                        }
                        // 双手势同时响应
                        .simultaneously(with: TapGesture()
                            .onEnded { _ in
                                print("Inside Tapped")
                            }
                        )
                )
                // 点击的话优先打印Tapped
                .highPriorityGesture(
                    TapGesture()
                        .onEnded { _ in
                            print("Tapped")
                        }
                )
        }
    }
}

struct S13C5C6C7_Previews: PreviewProvider {
    static var previews: some View {
        S13C5C6C7()
    }
}
