//
//  S4C1.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/8/29.
//

import SwiftUI

struct S4C1C2C3C4C5C6: View {
    var body: some View {
        let name = "Sarah"
        let quote = """
        **"Be yourself;** everyone else is _already taken._"
        - **Oscar Wilde**
        """
        let attributedQuote = try! AttributedString(markdown: quote)
        VStack {
            Text("Hello ")
                .font(.title)
                .fontWeight(.semibold)
                .italic()
                .strikethrough(true, color: .red)
            + Text("World")
                .font(.title)
                .underline()
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                // 1
                .font(.custom("Papyrus", size: 24))
                // 2
                .foregroundColor(.purple)
                // 3
                .frame(maxWidth: .infinity, alignment: .leading)
                // 4
                .padding()
            Text("Hello, \(name)!\nThanks for using our app. \n\nWe hope you have a great experience.")
//                  .lineLimit(1)
                  .multilineTextAlignment(.center)
                  .padding()
            Group {
                Text("Welcome to my app!")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                        .padding()
                      
                Text("Explore the world")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                    .padding()

                Text("Discover new places and experiences")
                    .font(.headline)
                    .padding()

                Text("Get inspired")
                    .font(.subheadline)
                    .foregroundColor(.purple)
                    .padding()

                Text("Join our community")
                    .font(.callout)
                    .foregroundColor(.orange)
                    .padding()

                Text("Share your adventures with us")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding()

                Text("Follow us on social media")
                    .font(.caption)
                    .foregroundColor(.black)
                    .padding()
            }
            
            Text("**Bold** and _italic_ text!")
            Text(attributedQuote)
                  .font(.system(size: 16, weight: .medium, design: .serif))
                  .foregroundColor(.blue)
            Text("Rock Lobster")
                .font(.custom("Lobster-Regular",size: 36))
        }
    }
}

struct S4C1C2C3C4C5C6_Previews: PreviewProvider {
    static var previews: some View {
        S4C1C2C3C4C5C6()
    }
}
