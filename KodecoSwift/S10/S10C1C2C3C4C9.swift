//
//  S10C1.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/8/31.
//

import SwiftUI
import Combine

struct CustomProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            ProgressView(value: configuration.fractionCompleted)
                .tint(configuration.fractionCompleted! < 1.0 ? .red : .blue)
            Text("\(Int((configuration.fractionCompleted ?? 0) * 100))%")
        }
    }
}

struct CustomProgress: View {
    var progressValue = 0.5
    var body: some View {
        ProgressView(value: progressValue)
            .progressViewStyle(CustomProgressViewStyle())
//            .onAppear {
//                Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
//                    if progressValue < 1.0 {
//                        progressValue += 0.01
//                    } else {
//                        timer.invalidate()
//                    }
//                }
//            }
    }
}

struct SpinnerView: View {
    var body: some View {
        ProgressView()
            // Style 还有DefaultProgressViewStyle，LinearProgressViewStyle
            .progressViewStyle(CircularProgressViewStyle(tint: .blue))
            .scaleEffect(2.0, anchor: .center)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    // 模拟延时动作
                    // updateview
                }
            }
    }
}

struct CircularProgressView: View {
    let progress: CGFloat
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20)
                .opacity(0.1)
                .foregroundColor(.blue)
            
            Circle()
                // 截断圆
                .trim(from: 0.0, to: min(progress, 1.0))
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                .foregroundColor(.blue)
                // 逆时针90度，从上方开始计
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear, value: progress)
        }
    }
}

struct S10C1C2C3C4C9: View {
    @State private var progress: CGFloat = 0.0
    // publish 方法创建一个定时器发布者，按指定时间间隔发出当前时间，autoconnect启动定时器
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(spacing: 50) {
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: 300, height: 20)
                    .opacity(0.3)
                    .foregroundColor(.gray)
                Rectangle()
                    .frame(width: progress * 300, height: 20)
                    .foregroundColor(.green)
                    .animation(.easeInOut, value: progress)
            }
            SpinnerView()
            CustomProgress(progressValue: progress)
                .padding()
            CircularProgressView(progress: progress)
                .frame(width: 200, height: 200)
        }
        // 每次定时器触发时都会执行内部的方法
        .onReceive(timer) { _ in
            // 最大值为1
            if progress < 1.0 {
                progress += 0.01
            }
        }
    }
}

struct S10C1C2C3C4C9_Previews: PreviewProvider {
    static var previews: some View {
        S10C1C2C3C4C9()
    }
}
