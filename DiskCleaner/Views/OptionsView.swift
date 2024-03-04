//
//  OptionsView.swift
//  DiskCleaner
//
//  Created by Leo Ho on 2024/3/4.
//

import SwiftUI

struct OptionsView: View {
    
    @State private var vm = OptionsViewViewModel()
    
    var body: some View {
        VStack {
            Text("Disk Cleaner")
                .font(.largeTitle)
                .padding()
            
            Spacer()
            
            buildCleanOptionToggle(isOn: $vm.logsCleanIsOn,
                                   title: "Clean Logs")
            buildCleanOptionToggle(isOn: $vm.cachesCleanIsOn,
                                   title: "Clean Caches")
            buildCleanOptionToggle(isOn: $vm.allCleanIsOn,
                                   title: "Clean All (Logs and Caches)")
            
            Button {
                vm.clean()
            } label: {
                Text("Clean")
                    .font(.title2)
            }
            .frame(minWidth: 200, minHeight: 100)
            .padding()
        }
        .padding()
    }
}

#Preview {
    OptionsView()
        .frame(width: 300, height: 300)
}

// MARK: - @ViewBuilder

private extension OptionsView {
    
    @ViewBuilder
    func buildCleanOptionToggle<S>(isOn: Binding<Bool>,
                                   title: LocalizedStringKey,
                                   style: S = .switch) -> some View where S: ToggleStyle {
        HStack {
            Text(title)
                .font(.title3)
            Spacer()
            Toggle(isOn: isOn) {}
                .toggleStyle(style)
        }
    }
}
