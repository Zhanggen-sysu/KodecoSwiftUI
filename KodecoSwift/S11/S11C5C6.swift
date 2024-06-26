//
//  S11C5.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/9/7.
//

import SwiftUI

struct S11C5C6: View {
    var body: some View {
        ZStack {
            VStack {
                Text("Top")
                    .padding()
                    .background(Color.green)
                Spacer()
                    .frame(height: 20)
                Text("Middle")
                    .padding()
                    .background(Color.yellow)
                Spacer()
                    .frame(height: 20)
                Text("Bottom")
                    .padding()
                    .background(Color.red)
                HStack {
                    Image(systemName: "ant.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                    Text("Cute Ant")
                        .font(.title)
                        .padding(.leading, 10)
                    // 会占用尽可能大的空间，把两边的控件尽可能往外推
                    Spacer()
                    Image(systemName: "ladybug")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                    Text("Cheerful Ladybug")
                        .font(.title)
                        .padding(.leading, 10)
                }
                .padding()
            }

            Image(systemName: "sun.max.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.orange)
        }
    }
}

struct S11C5C6_Previews: PreviewProvider {
    static var previews: some View {
        S11C5C6()
    }
}
