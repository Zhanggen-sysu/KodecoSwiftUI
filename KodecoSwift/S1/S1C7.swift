//
//  Chap7.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/8/29.
//

import SwiftUI

struct S1C7: View {
    var body: some View {
        NavigationStack {
          VStack {
            Text("Welcome to my app!")
            NavigationLink(destination: S1C7_DetailView()) {
              Text("Go to Detail View")
            }
          }
          .navigationTitle("Home")
          .navigationBarTitleDisplayMode(.large)
          .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
              Button(action: {
                print("Settings tapped")
              }) {
                Text("Settings")
              }
            }
          }
        }
      }
}

struct S1C7_DetailView: View {
  var body: some View {
    Text("This is the detail view!")
      .navigationTitle("Detail")
      .navigationBarTitleDisplayMode(.large)
  }
}

struct S1C7_Previews: PreviewProvider {
    static var previews: some View {
        S1C7()
    }
}
