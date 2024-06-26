//
//  S14C1.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/9/14.
//

import SwiftUI

struct S14C1C2C3C4C5C6C7: View {
    @State private var textFieldInput = ""
    @State private var enteredText = "Type something..."
    /// 定义格式类型，如果不满足会显示nil
    @State private var name: PersonNameComponents? = nil
    
    @State private var yourName: String = ""
    @State private var email: String = ""
    
    @State private var inputText = ""
    
    @State private var password = ""
    
    var body: some View {
        VStack {
            // 单行输入框，添加axis表示文本过长时允许纵向滑动
            TextField("Enter Text Here", text: $textFieldInput, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .padding()
                .font(.headline)
                .frame(height: 100)
            Text("You entered: \(textFieldInput)")
            
            // 多行输入框
            TextEditor(text: $enteredText)
                .padding()
                .font(.body)
                .foregroundColor(.gray)
                .frame(height: 100)
            
            Text("Input: \(String(describing: name))")
            TextField(
                "Enter Your Full Name",
                value: $name,
                format: .name(style: .medium)
            )
            .padding()
            
            TextField("Enter Full Name", text: $yourName)
                // 首字母大写
                .textInputAutocapitalization(.words)
                // 帮助自动填充
                .textContentType(.name)
                .padding()
            TextField("Enter Email Address", text: $email)
                // 禁用自动大写
                .textInputAutocapitalization(.never)
                .keyboardType(.emailAddress)
                .textContentType(.emailAddress)
                .padding()
            
            // 定义样式
            TextField("Enter text", text: $inputText)
                .font(.title)
                .foregroundColor(.purple)
                .padding()
                .background(.yellow.opacity(0.2))
                .cornerRadius(10)
                .textFieldStyle(.roundedBorder)
            
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
                .padding()
                .cornerRadius(10)
                .shadow(radius: 10)
                .frame(width: 300)
                .padding(.bottom, 50)
        }
    }
}

struct S14C1C2C3C4C5C6C7_Previews: PreviewProvider {
    static var previews: some View {
        S14C1C2C3C4C5C6C7()
    }
}
