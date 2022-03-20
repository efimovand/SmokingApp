//
//  SmokingAppApp.swift
//  SmokingApp
//
//  Created by Андрей Ефимов on 25.02.2022.
//

import SwiftUI

/*
UserDefaults
 score = UserDefaults.standart.integer(forKey: "score")
 
 hours = UserDefaults.standard.integer(forKey: "hours")
 firstDay = UserDefaults.standard.bool(forKey: "firstDay")
 savedHours = UserDefaults.standart.object(forKey: "savedHours")
 
 dailyEconomy = UserDefaults.standart.integer(forKey: "dailyEconomy")
 isLaunchedBefore = UserDefaults.standart.bool(forKey: "isLaunchedBefore")
 savedTime = UserDefaults.standart.object(forKey: "savedTime")
 attempts = score = UserDefaults.standart.integer(forKey: "attempts")
*/

@main
struct SmokingAppApp: App {
    
    var body: some Scene {
        WindowGroup {
            firstLaunchLogic()
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
