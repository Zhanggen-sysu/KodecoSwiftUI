//
//  S16C2.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/9/18.
//

import SwiftUI
import AVKit
// 视频播放
struct VideoPlayerView: View {
    let videoURL: URL? = Bundle.main.url(forResource: "BookTrailer", withExtension: "m4v")
    
    var body: some View {
        VStack {
            if let url = videoURL {
                VideoPlayer(player: AVPlayer(url: url))
            } else {
                Text("Video not found")
            }
        }
    }
}

struct S16C2: View {
    var body: some View {
        VideoPlayerView()
    }
}

struct S16C2_Previews: PreviewProvider {
    static var previews: some View {
        S16C2()
    }
}
