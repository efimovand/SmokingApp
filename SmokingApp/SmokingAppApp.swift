//
//  SmokingAppApp.swift
//  SmokingApp
//
//  Created by Андрей Ефимов on 25.02.2022.
//

import SwiftUI

/*
UserDefaults
 score = UserDefaults.standart.integer(forKey: "score") +
 hours = UserDefaults.standard.integer(forKey: "hours") +
 dailyEconomy = UserDefaults.standart.integer(forKey: "dailyEconomy") +
 attempts = score = UserDefaults.standart.integer(forKey: "attempts") +
 
 firstDay = UserDefaults.standard.bool(forKey: "firstDay")
 savedHours = UserDefaults.standart.object(forKey: "savedHours")
 
 isLaunchedBefore = UserDefaults.standart.bool(forKey: "isLaunchedBefore")
 savedTime = UserDefaults.standart.object(forKey: "savedTime")
*/

@main
struct SmokingAppApp: App {
    
    @StateObject private var score = UserData()
    @StateObject private var dailyEconomy = UserData()
    @StateObject private var attempts = UserData()
    @StateObject private var hours = UserData()
    
    var body: some Scene {
        WindowGroup {
            firstLaunchLogic()
                .environmentObject(score)
                .environmentObject(dailyEconomy)
                .environmentObject(attempts)
                .environmentObject(hours)
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
