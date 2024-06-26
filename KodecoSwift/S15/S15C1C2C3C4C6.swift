//
//  S15C1.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/9/15.
//

import SwiftUI

struct Product {
    let name: String
    let price: Int
}

extension Product: Identifiable {
    var id: String { name }
}

struct ModalView1: View {
    // 引入dismiss方法，必须定义在想要移除的view里，而不能定义在调起其的view里
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            Text("This is a modal view")
            
            Button("Dismiss") {
                dismiss()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.blue.opacity(0.2))
        // 底部弹窗拉出的节点，先拉出屏幕一半，再拉出大屏
        .presentationDetents([.medium, .large])
    }
}

struct ProductDetailView: View {
    let product: Product
    
    var body: some View {
        VStack {
            Text(product.name)
                .font(.title)
            
            Text("Price: \(product.price)")
        }
    }
}

struct FullScreenModalView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("This is a full-screen modal view")
            Button("Dismiss") {
                dismiss()
            }
            .foregroundColor(.orange)
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.blue)
        .edgesIgnoringSafeArea(.all)
    }
}

struct S15C1C2C3C4C6: View {
    
    let products = [
        Product(name: "Macbook Pro", price: 1299),
        Product(name: "iPhone", price: 999),
        Product(name: "AirPods", price: 199)
    ]
    @State private var selectedProduct: Product?
    
    @State private var showModal = false
    
    @State private var showFullModal = false
    
    var body: some View {
        
        VStack {
            Button("Show Modal") {
                showModal = true
            }
            // 底部弹窗
            .sheet(isPresented: $showModal) {
    //            Text("This is a modal view")
                ModalView1()
            }
            
            Button("Show Fullscreen Modal") {
                showFullModal = true
            }
            .fullScreenCover(isPresented: $showFullModal) {
                FullScreenModalView()
            }
            
            List(products) { product in
                Text(product.name)
                    .onTapGesture {
                        selectedProduct = product
                    }
            }
            // 给底部弹窗传递数据
            .sheet(item: $selectedProduct) { product in
                ProductDetailView(product: product)
            }
        }
    }
}

struct S15C1C2C3C4C6_Previews: PreviewProvider {
    static var previews: some View {
        S15C1C2C3C4C6()
    }
}
