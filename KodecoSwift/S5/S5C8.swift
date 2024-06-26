//
//  S5C8.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/8/29.
//

import SwiftUI

struct S5C8: View {
    var body: some View {
        ZStack {
            Image("SunriseTent")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)

            Image("WavyPattern")
                .resizable()
                .scaledToFill()
                .blendMode(.multiply)
                .opacity(0.7)
        }
    }
}

struct S5C8_Previews: PreviewProvider {
    static var previews: some View {
        S5C8()
    }
}
