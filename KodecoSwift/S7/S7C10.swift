//
//  S7C10.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/8/30.
//

import SwiftUI

struct S7C10: View {
    @State private var numbers: [Int] = Array(1...20)
    @State private var isLoading = false
    @State private var isFinished = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(numbers, id: \.self) { number in
                    Text("Row \(number)")
                }
                if !isFinished {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .foregroundColor(.black)
//                        .foregroundColor(.red)
                        .onAppear {
                            loadMoreContent()
                        }
                }
            }.navigationTitle("Infinite List")
        }
    }
    
    func loadMoreContent() {
        if !isLoading {
            isLoading = true
            // This simulates an asynchronus call
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                let moreNumbers = numbers.count + 1...numbers.count + 20
                numbers.append(contentsOf: moreNumbers)
                isLoading = false
                if numbers.count > 250 {
                    isFinished =  true
                }
            }
        }
    }
}

struct S7C10_Previews: PreviewProvider {
    static var previews: some View {
        S7C10()
    }
}
