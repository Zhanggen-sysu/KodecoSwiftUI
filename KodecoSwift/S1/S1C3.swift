//
//  Chap3.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/8/29.
//

import SwiftUI

struct S1C3: View {
    var body: some View {
        VStack {
            Text("Hello, SwiftUI!")
                .padding()
            Button(action: {
                print("Button tapped!")
            }) {
              Text("Tap me!")
            }
        }
    }
}

struct S1C3_Previews: PreviewProvider {
    static var previews: some View {
        // 查看支持的设备xcrun simctl list devicetypes
        S1C3().previewDevice("iPhone 14 Pro")
        S1C3()
              .preferredColorScheme(.dark)
        S1C3()
              .previewInterfaceOrientation(.landscapeLeft)
    }
}
