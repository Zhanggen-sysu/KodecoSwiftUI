//
//  S11C10.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/9/7.
//

import SwiftUI

struct S11C10: View {
    var body: some View {
        ZStack {
            Image("bgImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                // 忽略安全区
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Welcome to Beach Paradise!")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .background(.black.opacity(0.7))
                    .cornerRadius(10)
                
                Spacer()
            }
            .padding(.horizontal)
        }
    }
}

struct S11C10_Previews: PreviewProvider {
    static var previews: some View {
        S11C10()
    }
}
