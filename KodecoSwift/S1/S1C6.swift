//
//  Chap6.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/8/29.
//

import SwiftUI

struct S1C6: View {
    var body: some View {
        Button(action: {
              print("Button Pressed")
            }, label: {
              Text("Press Me!")
                .font(.largeTitle)
                .foregroundColor(.white)
            })
            .padding()
            .background(
              LinearGradient(gradient: Gradient(colors: [.purple, .pink]), startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .cornerRadius(10)
    }
}

struct S1C6_Previews: PreviewProvider {
    static var previews: some View {
        S1C6()
    }
}
