//
//  S7C8.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/8/30.
//

import SwiftUI

struct Message {
    var content: String
    var isRead: Bool
}

struct S7C8C9: View {
    
    @State var messages: [Message] = [
        Message(content: "Hello!", isRead: false),
        Message(content: "How are you?", isRead: false),
        Message(content: "Happy coding!", isRead: false),
    ]
    
    var animals = ["Lion", "Tiger", "Elephant", "Leopard"]
    var plants = ["Rose", "Lily", "Tulip", "Orchid"]
    
    var body: some View {
        TabView {
            List {
                ForEach(messages.indices, id: \.self) { index in
                    Text(messages[index].content)
                        .swipeActions {
                            Button(role: .destructive) {
                                messages.remove(at: index)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                            Button {
                                messages[index].isRead.toggle()
                            } label: {
                                Label("Toggle Read", systemImage: messages[index].isRead ? "envelope.open.fill" : "envelope.fill").background(.blue)
                            }
                        }
                }
            }.tabItem {
                Image(systemName: "arrow.left")
                Text("Left swipe")
            }
            List(animals, id: \.self) { animal in
                Text(animal)
            }
            .tabItem {
                Image(systemName: "hare")
                Text("Animals")
            }

            List(plants, id: \.self) { plant in
                Text(plant)
            }
            .tabItem {
                Image(systemName: "leaf")
                Text("Plants")
            }
        }
    }
}

struct S7C8C9_Previews: PreviewProvider {
    static var previews: some View {
        S7C8C9()
    }
}
