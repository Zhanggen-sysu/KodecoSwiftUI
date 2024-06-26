//
//  S8C9.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/8/31.
//

import SwiftUI

struct S8C9: View {
    @State private var colorChoice = Color.white
    
    var body: some View {
        VStack {
            ColorPicker("Choice your color", selection: $colorChoice)
                .padding()
            Text("You chose: ")
                .font(.title)
            Rectangle()
                .fill(colorChoice)
                .frame(width: 50, height: 50)
                .padding()
        }
    }
}

struct S8C9_Previews: PreviewProvider {
    static var previews: some View {
        S8C9()
    }
}
