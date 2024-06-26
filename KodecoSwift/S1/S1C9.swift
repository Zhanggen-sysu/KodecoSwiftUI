//
//  Chap9.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/8/29.
//

import SwiftUI

struct S1C9: View {
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Information")) {
                    TextField("Username", text: $username)
                    TextField("Email", text: $email)
                }

                Section(header: Text("Login Credentials")) {
                    SecureField("Password", text: $password)
                }

                Section {
                    Button(action: register) {
                        Text("Register")
                    }
                }
            }
            .navigationTitle("Registration Form")
        }
    }

    func register() {
    // Implement registration functionality here
    }
}

struct S1C9_Previews: PreviewProvider {
    static var previews: some View {
        S1C9()
    }
}
