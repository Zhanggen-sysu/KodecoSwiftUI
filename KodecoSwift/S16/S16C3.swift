//
//  S16C3.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/9/18.
//

import SwiftUI
import AVKit
// 播放器控制
struct PlayerView: UIViewControllerRepresentable {
    // 表示 PlayerView 结构代表的 UIKit 视图的类型是 AVPlayerViewController
    typealias UIViewControllerType = AVPlayerViewController
    
    let player: AVPlayer
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        
    }
}

struct S16C3: View {
    let player = AVPlayer(url: URL(string: "https://archive.org/download/FlightOfApollo7/flight_of_apollo_7_512kb.mp4")!)
    
    var body: some View {
        VStack {
            // 网络视频
            PlayerView(player: player)
            HStack(spacing: 20) {
                Button {
                    self.player.volume = max(self.player.volume - 0.1, 0.0)
                } label: {
                    Image(systemName: "speaker.fill")
                }
                
                Button {
                    self.player.volume = min(self.player.volume + 0.1, 1.0)
                } label: {
                    Image(systemName: "speaker.wave.3.fill")
                }

                Button {
                    self.player.play()
                } label: {
                    Image(systemName: "play.fill")
                }
                
                Button {
                    self.player.pause()
                } label: {
                    Image(systemName: "pause.fill")
                }
                
                Button {
                    self.player.rate += 0.1
                } label: {
                    Image(systemName: "slowmo")
                }
                .padding()

            }
        }
    }
}

struct S16C3_Previews: PreviewProvider {
    static var previews: some View {
        S16C3()
    }
}
