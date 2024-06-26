//
//  S12C7.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/9/14.
//

import SwiftUI

struct S12C7C8C9: View {
    
    @State private var isAnimating = false
    @State private var isAnimate = false
    @State private var isStepOne = false
    @State private var isStepTwo = false
    @State private var isStepThree = false
    
    var body: some View {
        VStack {
            // 延迟动画
            Button("Aniamte") {
                withAnimation(.easeInOut(duration: 2).delay(1)) {
                    isAnimating.toggle()
                }
            }
            .padding()
            RoundedRectangle(cornerRadius: isAnimating ? 50 : 10)
                .foregroundColor(.blue)
                .frame(width: isAnimating ? 300 : 100, height: isAnimating ? 300 : 100)
                .animation(.easeInOut(duration: 2), value: isAnimating)
            
            // 无限循环动画
            Circle()
                .fill(.blue)
                .frame(width: 50, height: 50)
                .scaleEffect(isAnimate ? 1.5 : 1)
                .animation(
                    isAnimate ?
                        .easeInOut(duration: 1).repeatForever(autoreverses: true) :
                        .default,
                    value: isAnimate
                )
                .onAppear {
                    isAnimate = true
                }
                .padding()
            
            // 分步动画
            Rectangle()
                .fill(isStepThree ? .green : .red)
                .frame(width: isStepTwo ? 100 : 50, height: isStepTwo ? 100 : 50)
                .offset(x: isStepOne ? 50 : 0, y: isStepOne ? 100 : 0)
                .animation(.easeInOut(duration: 1.0), value: isStepOne)
                .animation(.easeInOut(duration: 1.0), value: isStepTwo)
                .animation(.easeInOut(duration: 1.0), value: isStepThree)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        isStepOne = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            isStepTwo = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                isStepThree = true
                            }
                        }
                    }
                }
        }
    }
}

struct S12C7C8C9_Previews: PreviewProvider {
    static var previews: some View {
        S12C7C8C9()
    }
}
