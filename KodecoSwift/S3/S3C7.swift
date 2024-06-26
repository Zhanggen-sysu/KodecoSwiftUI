//
//  S3C7.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/8/29.
//

import SwiftUI

// Defining a custom environment value
struct ThemeKey: EnvironmentKey {
    static let defaultValue: Theme = .light
}

extension EnvironmentValues {
    var theme: Theme {
        get { self[ThemeKey.self] }
        set { self[ThemeKey.self] = newValue }
    }
}

// Enum for the different themes
enum Theme {
    case light, dark
}

extension View {
    func theme(_ theme: Theme) -> some View {
        environment(\.theme, theme)
    }
}

struct ThemedView: View {
    @Environment(\.theme) var theme: Theme

    var body: some View {
        VStack {
            if theme == .light {
                Text("Light Theme")
                    .foregroundColor(.black)
                    .background(Color.white)
            } else {
                Text("Dark Theme")
                    .foregroundColor(.white)
                    .background(.black)
            }
        }
        .padding()
    }
}

struct S3C7: View {
    @State var theme: Theme = .light

    var body: some View {
        VStack {
            Button("Switch Theme") {
                // Setting our custom environment value
                switch theme {
                case .dark:
                    theme = .light
                case .light:
                    theme = .dark
                }
            }
            ThemedView()
        }
        .theme(theme)
    }
}

struct S3C7_Previews: PreviewProvider {
    static var previews: some View {
        S3C7()
    }
}
