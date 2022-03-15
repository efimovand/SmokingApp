//
//  SmokingAppApp.swift
//  SmokingApp
//
//  Created by Андрей Ефимов on 25.02.2022.
//

import SwiftUI

@main
struct SmokingAppApp: App {
    
    @StateObject private var score = Score()
    @StateObject private var dailyUse = SData()
    @StateObject private var pricePack = SData()
    
    var body: some Scene {
        WindowGroup {
            startView()
                .environmentObject(dailyUse)
                .environmentObject(pricePack)
        }
    }
}

//MainTabView
    //.environmentObject(score)
    //.environmentObject(dailyUse)
    //.environmentObject(pricePack)
