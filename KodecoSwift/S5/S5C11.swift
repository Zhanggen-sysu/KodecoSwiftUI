//
//  S5C11.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/8/29.
//

import SwiftUI

struct S5C11: View {
    @State private var isSelected = false
    @State private var changeColor = false
    var body: some View {
        VStack {
            Button(action: {
                isSelected.toggle()
            }) {
            Image("TransparentHedgy")
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .foregroundColor(isSelected ? .brown : .gray)
            }
            Image("TransparentHedgy")
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .foregroundColor(changeColor ? .purple : .gray)
                .onAppear {
                    withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                        changeColor.toggle()
                    }
                }
        }
    }
}

struct S5C11_Previews: PreviewProvider {
    static var previews: some View {
        S5C11()
    }
}
