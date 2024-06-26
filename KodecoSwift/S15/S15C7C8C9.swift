//
//  S15C7.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/9/15.
//

import SwiftUI

struct S15C7C8C9: View {
    @State private var showModal = false
    
    var body: some View {
        Button("Show Modal") {
            showModal = true
        }
        .sheet(isPresented: $showModal) {
            VStack {
                List(0..<50) { item in
                    Text("Item \(item)")
                }
            }
            .presentationDetents([.medium, .large])
//            .presentationBackground {
//                LinearGradient(gradient: Gradient(colors: [.pink, .orange, .purple]),
//                             startPoint: .top,
//                               endPoint: .bottom)
//            }
//            .presentationCornerRadius(21)
//            .presentationContentInteraction(.scrolls)
        }
    }
}

struct S15C7C8C9_Previews: PreviewProvider {
    static var previews: some View {
        S15C7C8C9()
    }
}
