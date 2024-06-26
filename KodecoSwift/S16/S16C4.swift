//
//  S16C4.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/9/18.
//

import SwiftUI
import AVKit
// 后台视频播放
struct MyPlayerView: UIViewControllerRepresentable {
    var videoURL = URL(string:"https://archive.org/download/ksnn_compilation_master_food_in_space/ksnn_compilation_master_food_in_space_512kb.mp4")!

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        let player = AVPlayer(url: videoURL)
        controller.player = player
        controller.player?.play()
        // 画中画
        controller.allowsPictureInPicturePlayback = true // enables PiP
        return controller
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {}
}
// 进入后台后，还需要播放音频，需要配置，见KodecoSwiftApp，另外Signing & Capabilities需要右上角添加Background Mode

struct S16C4: View {
    var body: some View {
        MyPlayerView()
    }
}

struct S16C4_Previews: PreviewProvider {
    static var previews: some View {
        S16C4()
    }
}
