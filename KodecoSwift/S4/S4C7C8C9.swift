//
//  S4C7.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/8/29.
//

import SwiftUI

struct S4C7C8C9: View {
    @State private var name = ""
    @State private var password = ""
    var body: some View {
        VStack {
            TextField("Enter your name", text: $name)
                  .foregroundColor(.blue)
                  .background(.yellow)
                  .font(.largeTitle)
                  .multilineTextAlignment(.center)
                  .submitLabel(.done) // .continue, .done, .go, .join, .next, .return, .route, .search and .send
                  .padding()
                  .onSubmit {
                      print("Name entered: \(name)")
                  }
            SecureField("Enter your password", text: $password)
                  .textContentType(.password)
                  .padding()
                  .background(RoundedRectangle(cornerRadius: 5).stroke())
                  .multilineTextAlignment(.center)
                  .keyboardType(.numberPad) // type .default, .numberPad, .emailAddress, .webSearch
                  .padding()
        }
    }
}

struct S4C7C8C9_Previews: PreviewProvider {
    static var previews: some View {
        S4C7C8C9()
    }
}
