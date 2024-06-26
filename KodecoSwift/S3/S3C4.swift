//
//  S3C4.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/8/29.
//

import SwiftUI

class TimerManager: ObservableObject {
    @Published var timerCount = 0
    private var timer = Timer()

    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
        self.timerCount += 1
        }
    }

    func stop() {
        timer.invalidate()
    }
}

struct S3C4: View {
    @StateObject private var timerManager = TimerManager()

    var body: some View {
        VStack {
            Text("Timer count: \(timerManager.timerCount)")
            Button(action: {
                timerManager.start()
            }) {
                Text("Start Timer")
            }
            Button(action: {
                timerManager.stop()
            }) {
                Text("Stop Timer")
            }
        }
    }
}

struct S3C4_Previews: PreviewProvider {
    static var previews: some View {
        S3C4()
    }
}
