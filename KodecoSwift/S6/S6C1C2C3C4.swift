//
//  S6C1.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/8/29.
//

import SwiftUI

struct S6C1C2C3C4: View {
    var body: some View {
        VStack {
            Button("Sumit") {
                buttonTap()
            }
            .font(.headline)
            .padding()
            .foregroundColor(.white)
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    //        .cornerRadius(5)
            Button(action: {
                
            }) {
                Image("AvocadoFriend")
                    .resizable()
                    .frame(width: 100, height: 100)
            }

        }
    }
    func buttonTap() {
        print("Button was tapped!")
    }
}

struct S6C1C2C3C4_Previews: PreviewProvider {
    static var previews: some View {
        S6C1C2C3C4()
    }
}
