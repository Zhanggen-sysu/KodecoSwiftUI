//
//  S16C1.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/9/18.
//

import SwiftUI
import AVFoundation
// 音频播放
class AudioPlayerViewModel: ObservableObject {
    var audioPlayer: AVAudioPlayer?
    
    @Published var isPlaying = false
    
    init() {
        if let sound = Bundle.main.path(forResource: "PocketCyclopsLvl1", ofType: "mp3") {
            do {
                self.audioPlayer = try AVAudioPlayer(contentsOf: URL(filePath: sound))
            } catch {
                print("AVAudioPlayer could not be instantiated.")
            }
        } else {
            print("Audio file could not be found.")
        }
    }
    
    func playOrPause() {
        guard let player = audioPlayer else { return }
        
        if player.isPlaying {
            player.pause()
            isPlaying = false
        } else {
            player.pause()
            isPlaying = true
        }
    }
}


struct S16C1: View {
    @StateObject var audioPlayerViewModel = AudioPlayerViewModel()
    
    var body: some View {
        VStack {
            Button {
                audioPlayerViewModel.playOrPause()
            } label: {
                Image(systemName: audioPlayerViewModel.isPlaying ? "pause.circle" : "play.circle")
                    .resizable()
                    .frame(width: 64, height: 64)
            }

        }
    }
}

struct S16C1_Previews: PreviewProvider {
    static var previews: some View {
        S16C1()
    }
}
