//
//  S3C5.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/8/29.
//

import SwiftUI
import Combine

struct S3C5: View {
    @StateObject private var jokeFetcher = JokeFetcher()

    var body: some View {
        VStack {
            Text(jokeFetcher.joke)
                .padding()
            Button("Fetch Joke") {
                jokeFetcher.fetchJoke()
            }
        }
        .onAppear {
            jokeFetcher.fetchJoke()
        }
    }
}

class JokeFetcher: ObservableObject {
    @Published var joke: String = ""
    private var cancellable: AnyCancellable?
    private let jokes = [
        "Why don't scientists trust atoms? Because they make up everything!",
        "Why did the bicycle fall over? Because it was two tired!",
        "Why don't some animals play cards? Because they are afraid of cheetahs!",
        "Why did the scarecrow win an award? Because he was outstanding in his field!"
    ]

    func fetchJoke() {
        // Networking code here
        // Update `joke` with the result
        if let randomJoke = jokes.randomElement() {
            joke = randomJoke
        }
    }

    deinit {
        cancellable?.cancel()
    }
}

struct S3C5_Previews: PreviewProvider {
    static var previews: some View {
        S3C5()
    }
}
