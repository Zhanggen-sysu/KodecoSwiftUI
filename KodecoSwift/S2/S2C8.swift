//
//  S2C8.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/8/29.
//

import SwiftUI

struct BoldAndItalicModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .fontWeight(.bold)
            .italic()
    }
}

struct S2C8: View {
    var body: some View {
        Text("Hello, World!")
              .modifier(BoldAndItalicModifier())
    }
}

struct S2C8_Previews: PreviewProvider {
    static var previews: some View {
        S2C8()
    }
}
