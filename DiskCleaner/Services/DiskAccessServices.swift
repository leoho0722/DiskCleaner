//
//  DiskAccessServices.swift
//  DiskCleaner
//
//  Created by Leo Ho on 2024/3/4.
//

import SwiftUI

struct DiskAccessServices {
    
    var authorizationStatus: AuthorizationStatus = .unknown
    
    enum AuthorizationStatus {
        
        /// 未知授權狀態
        case unknown
        
        /// 已進行授權
        case authorized
        
        /// 拒絕授權
        case denied
    }
    
    static func requestAuthorization() -> AuthorizationStatus {
        let checkFilePath = "/Library/Application Support/com.apple.TCC/TCC.db"
        let status = FileManager.default.isReadableFile(atPath: checkFilePath)
        return status ? .authorized : .denied
    }
}
