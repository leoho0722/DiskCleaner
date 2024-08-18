//
//  DiskCleanerApp.swift
//  DiskCleaner
//
//  Created by Leo Ho on 2024/3/4.
//

import SwiftUI

@main
struct DiskCleanerApp: App {
    
    @State private var optionsVM = OptionsViewViewModel()
    @State private var diskAccessPermission: Bool = false
    
    var body: some Scene {
        WindowGroup {
            OptionsView(diskAccessPermission: diskAccessPermission)
                .frame(width: diskAccessPermission ? 300 : 570, height: 250)
                .task {
                    diskAccessPermission = await optionsVM.checkPermissions()
                }
        }
        .windowResizability(.contentSize)
    }
}
