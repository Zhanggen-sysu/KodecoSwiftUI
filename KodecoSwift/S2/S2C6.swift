//
//  S2C6.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/8/29.
//

import SwiftUI

struct S2C6: View {
    var body: some View {
        Text("Hello,\nCircular View!")
          .multilineTextAlignment(.center)
          .padding(50)
          .foregroundColor(.white)
          .background(
            Circle()
              .fill(Color.blue)
              .frame(width: 200, height: 200)
          )
    }
}

struct S2C6_Previews: PreviewProvider {
    static var previews: some View {
        S2C6()
    }
}
