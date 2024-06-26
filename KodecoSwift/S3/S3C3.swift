//
//  S3C3.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/8/29.
//

import SwiftUI

class GameSettings: ObservableObject {
    @Published var score = 0
}

struct S3C3: View {
    var body: some View {
        GameView()
            .environmentObject(GameSettings())
    }
}

struct GameView: View {
    @EnvironmentObject var settings: GameSettings

    var body: some View {
        VStack {
            Text("Score: \(settings.score)")
            Button("Increment Score") {
                settings.score += 1
            }
        }
    }
}

struct S3C3_Previews: PreviewProvider {
    static var previews: some View {
        S3C3()
    }
}
