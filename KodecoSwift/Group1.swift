//
//  Group1.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/9/7.
//

import SwiftUI

struct Group1: View {
    var body: some View {
//        NavigationStack {
//            List {
                Section("Getting Started") {
                   NavigationLink("Text and font") {
                       S1C1C4()
                   }
                   NavigationLink("View hierarchies") {
                       S1C2()
                   }
                   NavigationLink("Previews scenes") {
                       S1C3()
                   }
                   NavigationLink("Image view") {
                       S1C5()
                   }
                   NavigationLink("Button") {
                       S1C6()
                   }
                   NavigationLink("Navigtion stack") {
                       S1C7()
                   }
                   NavigationLink("List view") {
                       S1C8()
                   }
                   NavigationLink("Form") {
                       S1C9()
                   }
               }
               Section("View & Modifiers") {
                   NavigationLink("View modifiers") {
                       S2C1C2C5()
                   }
                   NavigationLink("Shadow") {
                       S2C3()
                   }
                   NavigationLink("Clip shape") {
                       S2C4()
                   }
                   NavigationLink("Circular shape") {
                       S2C6()
                   }
                   NavigationLink("Grid view") {
                       S2C7()
                   }
                   NavigationLink("Custom view modifiers") {
                       S2C8()
                   }
                   NavigationLink("Custom shape") {
                       S2C9()
                   }
               }
               
               Section("UI State") {
                   NavigationLink("State & Binding") {
                       S3C1()
                   }
                   NavigationLink("ObservableObject & ObservedObject") {
                       S3C2()
                   }
                   NavigationLink("Environment Objects") {
                       S3C3()
                   }
                   NavigationLink("StateObject") {
                       S3C4()
                   }
                   NavigationLink("Combine") {
                       S3C5()
                   }
                   NavigationLink("AppStorage & SceneStorage") {
                       S3C6()
                   }
                   NavigationLink("Custom environment key") {
                       S3C7()
                   }
                   NavigationLink("State management") {
                       S3C8()
                   }
               }
//            }
//        }
    }
}

struct Group1_Previews: PreviewProvider {
    static var previews: some View {
        Group1()
    }
}
