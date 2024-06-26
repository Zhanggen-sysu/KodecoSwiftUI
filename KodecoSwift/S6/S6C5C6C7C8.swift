//
//  S6C5.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/8/29.
//

import SwiftUI

struct S6C5C6C7C8: View {
    @State private var isButtonDisabled = false
    
    var body: some View {
        VStack {
            // Horizontal group of buttons
            HStack {
                Button("Red", action: {
                    print("Red")
                })
                .foregroundColor(.red)
                .disabled(isButtonDisabled)
                Button("Green", action: {
                    print("Green")
                })
                .foregroundColor(.green)
                .disabled(isButtonDisabled)
                Button("Blue", action: {
                    print("Blue")
                })
                .foregroundColor(.blue)
                .disabled(isButtonDisabled)
            }

            Divider()

            // Vertical group of buttons
            VStack {
                Button {
                    
                } label: {
                    Label("Red", systemImage: "heart.fill")
                        .padding()
                        .foregroundColor(.red)
                }
                Button("Green", action: {})
                .foregroundColor(.green)
                Button("Blue", action: {})
                .foregroundColor(.blue)
            }
            Toggle(isOn: $isButtonDisabled) {
                Text("Button Disabled")
            }
            .toggleStyle(.automatic)
            .padding()
        }
    }
}

struct S6C5C6C7C8_Previews: PreviewProvider {
    static var previews: some View {
        S6C5C6C7C8()
    }
}
