//
//  OptionsViewViewModel.swift
//  DiskCleaner
//
//  Created by Leo Ho on 2024/3/4.
//

import Observation
import SwiftUI

@MainActor
@Observable
class OptionsViewViewModel {
    
    func checkPermissions() async -> Bool {
        let status = DiskAccessServices.requestAuthorization()
        return status == .authorized
    }
    
    func clean(_ type: CleanDiskServices.CleanMode?) {
        guard let mode = type else {
            return
        }
        let services = CleanDiskServices()
        do {
            try services.clean(mode: mode)
        } catch {
            print(error)
        }
    }
}
