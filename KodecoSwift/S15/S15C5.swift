//
//  S15C5.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/9/15.
//

import SwiftUI

struct S15C5: View {
    @State private var showPopover = false
    
    var body: some View {
        Button("Show Popover") {
            showPopover.toggle()
        }
        .buttonStyle(.borderedProminent)
        .popover(isPresented: $showPopover, attachmentAnchor: .point(.topLeading)) {
            Text("This is a Popover")
                .padding()
                .frame(minWidth: 300, maxHeight: 400)
                .background(.red)
//                .presentationCompactAdaptation(.popover)
        }
    }
}

struct S15C5_Previews: PreviewProvider {
    static var previews: some View {
        S15C5()
    }
}
