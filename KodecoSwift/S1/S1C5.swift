//
//  Chap5.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/8/29.
//

import SwiftUI

struct S1C5: View {
    var body: some View {
        Image("CoolCat")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: 200, height: 200)
              .clipShape(Circle())
              .overlay(Circle().stroke(Color.white, lineWidth: 4))
              .shadow(radius: 7)
    }
}

struct S1C5_Previews: PreviewProvider {
    static var previews: some View {
        S1C5()
    }
}
