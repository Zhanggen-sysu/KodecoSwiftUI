//
//  Group2.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/9/7.
//

import SwiftUI

struct Group2: View {
    var body: some View {
//        NavigationStack {
//            List {
                Section("Text & TextField") {
                    NavigationLink("Create text") {
                        S4C1C2C3C4C5C6()
                    }
                    NavigationLink("TextField & SecureField") {
                        S4C7C8C9()
                    }
                }
                
                Section("Image & Icon") {
                    NavigationLink("Image & SF Symbols") {
                        S5C1C2C3C4()
                    }
                    NavigationLink("Custom shape image") {
                        S5C5C6()
                    }
                    NavigationLink("Image filter") {
                        S5C7()
                    }
                    NavigationLink("Image mix") {
                        S5C8()
                    }
                    NavigationLink("Image animation") {
                        S5C9()
                    }
                    NavigationLink("Image picker") {
                        S5C10()
                    }
                    NavigationLink("Image render mode") {
                        S5C11()
                    }
                }
                
                Section("Button") {
                    NavigationLink("Create Button") {
                        S6C1C2C3C4()
                    }
                    NavigationLink("Custom Button & Toggle") {
                        S6C5C6C7C8()
                    }
                    NavigationLink("Fullscreen Button") {
                        S6C9()
                    }
                    NavigationLink("3D Button") {
                        S6C10()
                    }
                }
                
                Section("List") {
                    NavigationLink("Create List") {
                        S7C1C2()
                    }
                    NavigationLink("Navigation") {
                        S7C3C4C5()
                    }
                    NavigationLink("Search") {
                        S7C6C7()
                    }
                    NavigationLink("Tabview, SwipeAction") {
                        S7C8C9()
                    }
                    NavigationLink("Infinitely List") {
                        S7C8C9()
                    }
                }
                
                Section("Forms & Controls") {
                    NavigationLink("Forms & Controls") {
                        S8C2C3C4C5C6C7C8()
                    }
                    NavigationLink("Color Picker") {
                        S8C9()
                    }
                }
                
                Section("TabView & Split View") {
                    NavigationLink("Custom TabView") {
                        S9C1C2C3()
                    }
                    NavigationLink("Split View") {
                        S9C4C5C6()
                    }
                    NavigationLink("Sheet & TabView Control") {
                        S9C7C8C9C10()
                    }
                }
                
                Section("Progress View") {
                    NavigationLink("Custom Progress View") {
                        S10C1C2C3C4C9()
                    }
                    NavigationLink("(In)Determinate Progress") {
                        S10C5C6C7()
                    }
                    NavigationLink("Segmented Progress") {
                        S10C8()
                    }
                }
                
                
//            }
//        }
    }
}

struct Group2_Previews: PreviewProvider {
    static var previews: some View {
        Group2()
    }
}
