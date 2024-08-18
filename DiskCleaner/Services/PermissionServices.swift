//
//  PermissionServices.swift
//  DiskCleaner
//
//  Created by Leo Ho on 2024/8/18.
//

import Foundation
import SwiftUI

struct PermissionServices {
    
    /// 權限種類
    enum PermissionType {
        
        /// 完全取用磁碟
        case fullAccessDisk
        
        var path: String {
            switch self {
            case .fullAccessDisk:
                return "x-apple.systempreferences:com.apple.preference.security?Privacy_AllFiles"
            }
        }
    }
    
    enum PermissionError: Error {
        
        case invalidURL
    }
    
    static func open(_ type: PermissionType) throws {
        guard let url = URL(string: type.path) else {
            throw PermissionError.invalidURL
        }
        NSWorkspace.shared.open(url)
    }
}
