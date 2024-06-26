//
//  S12C1.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/9/7.
//

import SwiftUI

struct S12C1C2C3C4C5C6: View {
    
    @State private var isAnimated = false
    @State private var opacity: Double = 0.0
    @State private var offset = CGSize(width: 0, height: 0)
    @State private var rotate = false
    @State private var scale: CGFloat = 1.0
    @State private var angle: Double = 0.0
    
    var body: some View {
        VStack {
            // 大小动画
            RoundedRectangle(cornerRadius: 20)
                .fill(.blue)
                .frame(width: isAnimated ? 200 : 100, height: 100)
            // 除了linear，还有spring, easeInOut, easeIn, easeOut
            // value表示参数发生变化时，这个动画就会触发
                .animation(.linear(duration: 1), value: isAnimated)
                .onTapGesture {
                    isAnimated.toggle()
                }
            
            // 透明动画
            Text("Hello, SwiftUI!")
                .opacity(opacity)
                .font(.largeTitle)
                .padding()
            
            Button(opacity == 0.0 ? "Fade In" : "Fade Out") {
                withAnimation(.easeInOut(duration: 2)) {
                    opacity = opacity == 0.0 ? 1.0 : 0.0
                }
            }
            
            // 平移动画
            // 添加手势
            // 可拖动的图片，跟着手势移动，松手后恢复原来的位置
            Image(systemName: "arrow.up")
                .font(.largeTitle)
                .offset(offset)
                .animation(.spring(), value: offset)
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            offset = value.translation
                        })
                        .onEnded({ _ in
                            withAnimation {
                                offset = .zero
                            }
                        })
                )
            
            // 旋转动画
            Button {
                rotate.toggle()
            } label: {
                Text("Rotate")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .background(.blue)
                    .cornerRadius(10)
            }
            // 还有其他effect
            .rotation3DEffect(.degrees(rotate ? 180 : 0), axis: (x: 0, y: 1, z: 0))
            .animation(.easeInOut(duration: 0.5), value: rotate)
            
            // 放缩动画
            Button("Tap Me!") {
                scale += 0.5
            }
            .scaleEffect(scale)
            .animation(.easeInOut(duration: 0.2), value: scale)
            
            // 弹簧动画
            Rectangle()
                .foregroundColor(.blue)
                .frame(width: 150, height: 150)
                .rotationEffect(.degrees(angle))
                .onTapGesture {
                    angle += 360
                }
                .animation(.spring(response: 0.5, dampingFraction: 0.4), value: angle)
        }
    }
}

struct S12C1C2C3C4C5C6_Previews: PreviewProvider {
    static var previews: some View {
        S12C1C2C3C4C5C6()
    }
}
