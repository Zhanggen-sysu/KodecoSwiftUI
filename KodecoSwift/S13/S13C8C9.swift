//
//  S13C8.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/9/14.
//

import SwiftUI

enum RotationState : Equatable {
    case inactive
    case pressing
    case rotating(angle: Angle)
    
    var angle: Angle {
        switch self {
        case .inactive, .pressing:
            return .zero
        case .rotating(let angle):
            return angle
        }
    }
    
    var isRotating: Bool {
        switch self {
        case .inactive, .pressing:
            return false
        case .rotating:
            return true
        }
    }
}

struct S13C8C9: View {
    // GestureState手势结束时会自动将属性设置回初始值
    @GestureState private var rotationState = RotationState.inactive
    @State private var rotationAngle = Angle.zero
    
    @State private var dragOffset = CGSize.zero
    @State private var originalPosition = CGSize.zero
    
    var body: some View {
        // 手势顺序，先触发长按，再按alt/option触发旋转手势
        let longPressBeforeRotation = LongPressGesture(minimumDuration: 0.5)
            .sequenced(before: RotationGesture())
            // 第三个是transaction，是个inout值，用于存储整个动画上下文
            .updating($rotationState) { value, state, _ in
                switch value {
                case .first(true):
                    state = .pressing
                case .second(true, let rotation):
                    state = .rotating(angle: rotation ?? .zero)
                default:
                    state = .inactive
                }
            }
            .onEnded { value in
                guard case .second(true, let rotation?) = value else {return}
                self.rotationAngle = rotation
            }
        
        let dragGesture = DragGesture()
            .onChanged { value in
                self.dragOffset = value.translation
            }
            .onEnded { _ in
                self.originalPosition = self.dragOffset
            }
        let doubleTapGesture = TapGesture(count: 2)
            .onEnded {
                self.dragOffset = .zero
            }
        
        VStack {
            Image(systemName: "arrow.triangle.2.circlepath")
                .font(.system(size: 100))
                .rotationEffect(rotationState.angle + rotationAngle)
                .foregroundColor(rotationState.isRotating ? .blue : .red)
                .animation(.default, value: rotationState)
                .gesture(longPressBeforeRotation)
            Image(systemName: "bird")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .offset(dragOffset)
                .gesture(
                    // 当触发了双击手势，拖动手势就不再响应
                    doubleTapGesture.exclusively(before: dragGesture)
                )
                .animation(.easeInOut, value: dragOffset)
        }
    }
}

struct S13C8C9_Previews: PreviewProvider {
    static var previews: some View {
        S13C8C9()
    }
}
