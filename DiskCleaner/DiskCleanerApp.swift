//
//  DiskCleanerApp.swift
//  DiskCleaner
//
//  Created by Leo Ho on 2024/3/4.
//

import SwiftUI

@main
struct DiskCleanerApp: App {
    var body: some Scene {
        WindowGroup {
            OptionsView()
        }
        .windowResizability(.contentSize)
    }
}
