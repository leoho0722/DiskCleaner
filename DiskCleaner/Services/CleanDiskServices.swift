//
//  CleanDiskServices.swift
//  DiskCleaner
//
//  Created by Leo Ho on 2024/3/4.
//

import Foundation

struct CleanDiskServices {
    
    private let fileManager = FileManager.default
    
    enum CleanMode: Int, CaseIterable, Identifiable {
        
        /// 清除 ~/Library/Caches 和 ~/Library/Logs 目錄內的所有檔案與資料夾
        case all
        
        /// 清除 ~/Library/Caches 目錄內的所有檔案與資料夾
        case caches
        
        /// 清除 ~/Library/Logs 目錄內的所有檔案與資料夾
        case logs
        
        var id: Int { rawValue }
        
        var title: String {
            switch self {
            case .all:
                "清除全部 (Logs 和 Caches)"
            case .caches:
                "清除 Caches"
            case .logs:
                "清除 Logs"
            }
        }
    }
    
    /// 根據開啟的清除模式，來刪除對應資料
    ///
    /// - Parameters:
    ///   - mode: ``CleanMode`` 清除模式
    func clean(mode: CleanMode) throws {
        switch mode {
        case .all:
            try cleanAll()
        case .caches:
            try cleanCaches()
        case .logs:
            try cleanLogs()
        }
    }
}

private extension CleanDiskServices {
    
    /// 清除 ~/Library/Caches 和 ~/Library/Logs 目錄內的所有檔案與資料夾
    func cleanAll() throws {
        try cleanCaches()
        try cleanLogs()
    }
    
    /// 清除 ~/Library/Caches 目錄內的所有檔案與資料夾
    func cleanCaches() throws {
        let cachesDir = try fileManager.url(for: .cachesDirectory,
                                            in: .userDomainMask,
                                            appropriateFor: nil,
                                            create: false)
        let allFilesInCachesDir = fileManager.enumerator(atPath: cachesDir.path())
        while let file = allFilesInCachesDir?.nextObject() as? String {
            try fileManager.removeItem(atPath: cachesDir.path() + file)
        }
    }
    
    /// 清除 ~/Library/Logs 目錄內的所有檔案與資料夾
    func cleanLogs() throws {
        let logsDir = try fileManager.url(for: .libraryDirectory,
                                          in: .userDomainMask,
                                          appropriateFor: nil,
                                          create: false).appending(path: "Logs/")
        let allFilesInLogsDir = fileManager.enumerator(atPath: logsDir.path())
        while let file = allFilesInLogsDir?.nextObject() as? String {
            try fileManager.removeItem(atPath: logsDir.path() + file)
        }
    }
}
