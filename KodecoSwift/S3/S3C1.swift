//
//  S3C1.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/8/29.
//

import SwiftUI

struct S3C1: View {
    @State private var isSwitchedOn = false
    @State private var selectedColor = Color.red

    var body: some View {
        VStack {
            Toggle(isOn: $isSwitchedOn) {
                Text("Turn me on or off")
            }
            if isSwitchedOn {
                Text("The switch is on!")
            }
            Rectangle()
                .fill(selectedColor)
                .frame(width: 100, height: 100, alignment: .center)

            S3C1_ColorPickerView(selectedColor: $selectedColor)
        }
        .padding()
    }
}

struct S3C1_ColorPickerView: View {
    @Binding var selectedColor: Color

    let colors: [Color] = [.red, .green, .blue, .yellow, .orange]

    var body: some View {
        HStack {
            ForEach(colors, id: \.self) { color in
            Rectangle()
                .fill(color)
                .frame(width: 50, height: 50)
                .onTapGesture {
                    selectedColor = color
                }
            }
        }
    }
}

struct S3C1_Previews: PreviewProvider {
    static var previews: some View {
        S3C1()
    }
}
