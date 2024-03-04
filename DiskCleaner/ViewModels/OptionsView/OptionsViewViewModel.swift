//
//  OptionsViewViewModel.swift
//  DiskCleaner
//
//  Created by Leo Ho on 2024/3/4.
//

import Observation
import SwiftUI

@Observable
class OptionsViewViewModel {
    
    var allCleanIsOn: Bool = false
    
    var cachesCleanIsOn: Bool = false
    
    var logsCleanIsOn: Bool = false
    
    func clean() {
        let services = CleanDiskServices()
        do {
            if allCleanIsOn {
                // 清除 ~/Library/Caches 和 ~/Library/Logs 目錄內的所有檔案與資料夾
                try services.clean(mode: .all)
            } else {
                switch (cachesCleanIsOn, logsCleanIsOn) {
                case (true, false):
                    // 清除 ~/Library/Caches 目錄內的所有檔案與資料夾
                    try services.clean(mode: .caches)
                case (false, true):
                    // 清除 ~/Library/Logs 目錄內的所有檔案與資料夾
                    try services.clean(mode: .logs)
                default: break
                }
            }
        } catch {
            print(error)
        }
    }
}
