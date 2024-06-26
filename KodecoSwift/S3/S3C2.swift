//
//  S3C2.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/8/29.
//

import SwiftUI

class UserSettings: ObservableObject {
    @Published var username = "Anonymous"
}

struct S3C2: View {
    @ObservedObject var settings = UserSettings()

    var body: some View {
        VStack {
            Text("Hello, \(settings.username)!")
            Button("Change Username") {
                settings.username = "John Doe"
            }
        }
    }
}

struct S3C2_Previews: PreviewProvider {
    static var previews: some View {
        S3C2()
    }
}
