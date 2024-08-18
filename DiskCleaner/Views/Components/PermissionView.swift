//
//  PermissionView.swift
//  DiskCleaner
//
//  Created by Leo Ho on 2024/8/18.
//

import SwiftHelpers
import SwiftUI

struct PermissionView: View {
    
    var vm = PermissionViewViewModel()
    
    let message: String
    
    var body: some View {
        HStack {
            Image(symbols: .exclamationmarkTriangleFill)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30)
                .foregroundStyle(.yellow)
                .padding(.leading)
            Text(message)
                .padding()
            Spacer()
            Button {
                vm.openSettings(.fullAccessDisk)
            } label: {
                Text("前往設定")
            }
            .padding()
        }
        .background {
            RoundedRectangle(cornerRadius: 10, style: .circular)
                .frame(maxWidth: 550, maxHeight: 50)
                .foregroundStyle(.gray.opacity(0.5))
        }
    }
}

#Preview {
    PermissionView(message: "本應用需要全磁碟存取權限以正常運作。\n請前往「系統偏好設定 > 隱私權與安全性 > 完全取用磁碟」")
        .frame(minWidth: 300, minHeight: 100)
}
