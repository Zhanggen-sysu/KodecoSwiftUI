//
//  S2C3.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/8/29.
//

import SwiftUI

struct S2C3: View {
    var body: some View {
        VStack {
          Text("Hello, Shadows!")
            .font(.largeTitle)
            .padding()
            .background(Color.white)
            .shadow(radius: 10)
          Circle()
            .fill(Color.blue)
            .shadow(color: .purple, radius: 10, x: 0, y: 0)
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
        }
      }
}

struct S2C3_Previews: PreviewProvider {
    static var previews: some View {
        S2C3()
    }
}
