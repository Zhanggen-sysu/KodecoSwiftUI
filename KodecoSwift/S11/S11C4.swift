//
//  S11C4.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/9/7.
//

import SwiftUI

struct S11C4: View {
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                VStack(spacing: 20) {
                    ForEach(1...20, id: \.self) { index in
                        Text("Row \(index)")
                            .font(.title)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            
            Divider()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(1...20, id: \.self) { index in
                        Text("Item \(index)")
                            .font(.title)
                    }
                }
                .padding()
            }
        }
        
        
    }
}

struct S11C4_Previews: PreviewProvider {
    static var previews: some View {
        S11C4()
    }
}
