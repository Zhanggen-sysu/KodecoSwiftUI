//
//  S14C10.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/9/15.
//

import SwiftUI

struct S14C10: View {
    
    @State private var text = ""
    @State private var message = (0 ..< 50).map { number in
        "Message \(number)"
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    ForEach(message.indices, id: \.self) { index in
                        Text("\(message[index])")
                            .padding(10)
                            .background(index % 2 == 0 ? .green : .blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .frame(maxWidth: .infinity, alignment: index % 2 == 0 ? .leading : .trailing)
                            // ⚠️注意用法
                            .padding([.horizontal, .top])
                    }
                }
                // 滚动时收起键盘
                .scrollDismissesKeyboard(.immediately)
                
                HStack {
                    TextField("Type a message...", text: $text)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                    
                    Button {
                        message.append(text)
                        text = ""
                    } label: {
                        Image(systemName: "paperplane.fill")
                            .padding()
                    }
                }
            }
            .navigationTitle("Chat")
        }
    }
}

struct S14C10_Previews: PreviewProvider {
    static var previews: some View {
        S14C10()
    }
}
