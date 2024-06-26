//
//  S6C9.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/8/29.
//

import SwiftUI

struct S6C9: View {
    var body: some View {
        FullScreenButtonView()
    }
}

struct FullScreenButtonView: View {
    var body: some View {
        Button(action: {
            print("Full Screen Button Tapped")
        }, label: {
            Text("Full Screen Button")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        })
    }
}

struct S6C9_Previews: PreviewProvider {
    static var previews: some View {
        S6C9()
    }
}
