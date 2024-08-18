//
//  OptionsView.swift
//  DiskCleaner
//
//  Created by Leo Ho on 2024/3/4.
//

import SwiftUI

struct OptionsView: View {
    
    @State private var vm = OptionsViewViewModel()
    @State private var selectedCleanMode: CleanDiskServices.CleanMode?
    @State private var showFullAccessDiskPermissionAlert: Bool = false
    let diskAccessPermission: Bool
    
    var body: some View {
        VStack {
            Text("磁碟空間清除小工具")
                .font(.largeTitle)
                .padding(.top)
            
            if !diskAccessPermission {
                PermissionView(message: "本應用需要完全取用磁碟權限以正常運作。\n請前往「系統偏好設定 > 隱私權與安全性 > 完全取用磁碟」")
            }
            
            Picker("清除方式", selection: $selectedCleanMode) {
                ForEach(CleanDiskServices.CleanMode.allCases) { mode in
                    Text(mode.title)
                        .tag(mode)
                }
            }
            
            Text("開始清除")
                .font(.system(size: 15))
                .background {
                    RoundedRectangle(cornerRadius: 10, style: .circular)
                        .frame(minWidth: 200, minHeight: 25)
                        .foregroundStyle(.blue)
                }
                .onTapGesture {
                    guard diskAccessPermission else {
                        showFullAccessDiskPermissionAlert.toggle()
                        return
                    }
                    vm.clean($selectedCleanMode.wrappedValue)
                }
                .padding()
        }
        .padding()
        .alert("請先允許本應用存取「完全取用磁碟」權限，才能進行清除",
               isPresented: $showFullAccessDiskPermissionAlert) {
            Button("確認") {}
        }
    }
}

#Preview {
    OptionsView(diskAccessPermission: false)
}

#Preview {
    OptionsView(diskAccessPermission: true)
}
