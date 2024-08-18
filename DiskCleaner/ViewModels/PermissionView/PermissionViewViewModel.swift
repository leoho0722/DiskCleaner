//
//  PermissionViewViewModel.swift
//  DiskCleaner
//
//  Created by Leo Ho on 2024/8/18.
//

import Foundation

class PermissionViewViewModel {
    
    func openSettings(_ type: PermissionServices.PermissionType)  {
        do {
            try PermissionServices.open(type)
        } catch {
            print("錯誤：\(error)")
        }
    }
}
