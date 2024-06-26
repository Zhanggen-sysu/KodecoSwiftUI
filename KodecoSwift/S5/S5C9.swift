//
//  S5C9.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/8/29.
//

import SwiftUI

struct S5C9: View {
    @State private var isAnimating = false
    
    var body: some View {
        Image("HelloHedgy")
        .resizable()
        .scaledToFit()
        .scaleEffect(isAnimating ? 1.5 : 1.0)
        .onAppear() {
            withAnimation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
                isAnimating = true
            }
        }
    }
}

struct S5C9_Previews: PreviewProvider {
    static var previews: some View {
        S5C9()
    }
}
