//
//  S2C1and2.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/8/29.
//

import SwiftUI

struct S2C1C2C5: View {
    var body: some View {
        VStack {
            Text("Welcome to my amazing app!")
                  .font(.title)
                  .foregroundColor(.blue)
                  .opacity(0.5)
            Text("Hello, World!")
                  .frame(width: 200, height: 50)
                  .background(
                    Image("background")
                      .resizable(resizingMode: .tile)
                      .opacity(0.25)
                  )
                  .fontWeight(.heavy)
                  .border(Color.black, width: 2)
        }
    }
}

struct S2C1C2C5_Previews: PreviewProvider {
    static var previews: some View {
        S2C1C2C5()
    }
}
