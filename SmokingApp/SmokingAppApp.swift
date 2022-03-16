//
//  SmokingAppApp.swift
//  SmokingApp
//
//  Created by Андрей Ефимов on 25.02.2022.
//

import SwiftUI

@main
struct SmokingAppApp: App {
    
    @StateObject private var score = SData()
    @StateObject private var dailyEconomy = SData()
    @StateObject private var savedTime = SData()
    
    var body: some Scene {
        WindowGroup {
            firstLaunchLogic()
                .environmentObject(score)
                .environmentObject(dailyEconomy)
                .environmentObject(savedTime)
            //startView()
            //.environmentObject(dailyUse)
            //.environmentObject(pricePack)
        }
    }
}

//MainTabView
//.environmentObject(score)
//.environmentObject(dailyUse)
//.environmentObject(pricePack)
