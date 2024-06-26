//
//  S15C10.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/9/15.
//

import SwiftUI

struct S15C10: View {
    @State private var showModal = false
    @State private var hueValue = 0.5
    
    var body: some View {
        VStack {
            Color(hue: hueValue, saturation: 0.5, brightness: 1.0)
                .frame(width: 200, height: 200)
                .cornerRadius(10)
                .padding()
            
            Slider(value: $hueValue, in: 0...1)
                .padding()
            
            Button("Show Joke") {
                showModal = true
            }
            .sheet(isPresented: $showModal) {
                VStack {
                    Text("Why don't scientists trust atoms?")
                    Text("Because they make up everything!")
                }
                .presentationDetents([.height(120), .medium, .large])
//                .presentationBackgroundInteraction(.enabled(upThrough: .height(120)))
//                .presentationBackground {
//                    Color.orange.opacity(0.8)
//                }
            }
        }
    }
}

struct S15C10_Previews: PreviewProvider {
    static var previews: some View {
        S15C10()
    }
}
