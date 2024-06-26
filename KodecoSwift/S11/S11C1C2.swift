//
//  S11C1.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/9/1.
//

import SwiftUI

struct S11C1C2: View {
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.caption)
                .frame(width: 100, height: 50, alignment: .bottomLeading)
                .border(.red)
            MoonPhaseView(phase: "Waxing Crescent", image: Image(systemName: "moonphase.waxing.crescent"))
                .frame(maxWidth: 200)
            
        }
    }
}

struct MoonPhaseView: View {
    var phase: String
    var image: Image
    var body: some View {
        // 相当于view的switch，选择首个可以完整展示的UI展示，把width调小，就会只展示图片
        ViewThatFits {
            HStack {
                image
                    .resizable()
                    .scaledToFit()
                Text(phase)
            }
            image.resizable()
                .scaledToFit()
        }
        .padding()
    }
}

struct S11C1C2_Previews: PreviewProvider {
    static var previews: some View {
        S11C1C2()
    }
}
