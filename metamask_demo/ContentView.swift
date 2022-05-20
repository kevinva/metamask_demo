//
//  ContentView.swift
//  metamask_demo
//
//  Created by KevinHo on 2022/5/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HoWalletHomeView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone 12", "iPhone 12 Pro"], id: \.self) { deviceName in
            
            ContentView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
            
        }

    }
}
