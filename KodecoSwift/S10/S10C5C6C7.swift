//
//  S10C5.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/9/1.
//

import SwiftUI

struct S10C5C6C7: View {
    @State private var downloadProgress = 0.0
    @State private var timer: Timer? = nil
    
    var body: some View {
        NavigationStack {
            VStack (spacing: 50){
                // 设置好进度的最大值，就不用再用小数了
                ProgressView("Downloading...", value: downloadProgress, total: 100)
                    .progressViewStyle(.linear)
                Button("Start Download") {
                    simulateDownload()
                }
                indeterminateProgressView()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    // 线性样式ProgressView()需要有
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color.blue))
                }
            }
        }
    }
    
    func simulateDownload() {
        timer?.invalidate()
        downloadProgress = 0.0
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { timer in
            if (downloadProgress < 100) {
                downloadProgress += 1.0
            } else {
                timer.invalidate()
            }
        })
    }
}

struct indeterminateProgressView : View {
    @State private var isLoading = true
    
    var body: some View {
        VStack {
            ProgressView("Loading")
                .progressViewStyle(.circular)
                .scaleEffect(2.0, anchor: .center)
        }
        .onAppear {
            startAnimating()
        }
    }
    
    func startAnimating() {
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
            withAnimation(Animation.linear(duration: 1.5).repeatForever()) {
                isLoading = true
            }
        }
    }
}

struct S10C5C6C7_Previews: PreviewProvider {
    static var previews: some View {
        S10C5C6C7()
    }
}
