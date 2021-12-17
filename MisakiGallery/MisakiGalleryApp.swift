//
//  MisakiGalleryApp.swift
//  MisakiGallery
//
//  Created by Spike Liao on 2021/12/17.
//

import SwiftUI

@main
struct MisakiGalleryApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Cards())
        }
    }
}
