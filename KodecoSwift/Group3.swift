//
//  Group3.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/9/7.
//

import SwiftUI

struct Group3: View {
    var body: some View {
//        NavigationStack {
//            List {
                Section("Frame & Layout") {
                    NavigationLink("Layout & ViewThatFits") {
                        S11C1C2()
                    }
                    NavigationLink("LazyHGridView & LazyVGridView") {
                        S11C3()
                    }
                    NavigationLink("ScrollView") {
                        S11C4()
                    }
                }
//            }
//        }
    }
}

struct Group3_Previews: PreviewProvider {
    static var previews: some View {
        Group3()
    }
}
