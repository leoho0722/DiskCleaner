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
        
        /// 已進行有限授權
        case limited
    }
    
    static func requestAuthorization() {
        
    }
}
