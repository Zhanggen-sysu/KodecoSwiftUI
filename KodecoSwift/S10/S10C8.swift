//
//  S10C8.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/9/1.
//

import SwiftUI

struct S10C8: View {
    @State private var progressOne: CGFloat = 0
    @State private var progressTwo: CGFloat = 0
    @State private var progressThree: CGFloat = 0
    
    var body: some View {
        VStack {
            // 用来获取父view建议的尺寸
            GeometryReader { geometry in
                HStack(spacing: 0) {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.green)
                        .frame(height: 10)
                        .frame(width: progressOne * geometry.size.width / 3)
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.blue)
                        .frame(height: 10)
                        .frame(width: progressTwo * geometry.size.width / 3)
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.purple)
                        .frame(height: 10)
                        .frame(width: progressThree * geometry.size.width / 3)
                }
                .frame(height: 50)
            }
            Button("Start Task") {
                withAnimation(.easeInOut(duration: 2)) {
                    progressOne = 1.0
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation(.easeInOut(duration: 2)) {
                        progressTwo = 1.0
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                    withAnimation(.easeInOut(duration: 2)) {
                        progressThree = 1.0
                    }
                }
            }
            .padding()
            Spacer()
        }
        .padding()
    }
}

struct S10C8_Previews: PreviewProvider {
    static var previews: some View {
        S10C8()
    }
}
