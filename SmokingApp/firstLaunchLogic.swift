//
//  firstLaunchLogic.swift
//  SmokingApp
//
//  Created by Андрей Ефимов on 16.03.2022.
//

import SwiftUI

import SwiftUI
import Foundation

class UserData: ObservableObject {
    @Published var isLaunchedBefore = UserDefaults.standard.bool(forKey: "isLaunchedBefore")
    @Published var score = UserDefaults.standard.integer(forKey: "score")
    @Published var dailyEconomy = UserDefaults.standard.integer(forKey: "dailyEconomy")
    @Published var attempts = UserDefaults.standard.integer(forKey: "attempts")
    @Published var hours = UserDefaults.standard.integer(forKey: "hours")
    @Published var firstDay = UserDefaults.standard.bool(forKey: "firstDay")
    @Published var isGoal = UserDefaults.standard.bool(forKey: "isGoal")
    @Published var goalValue = UserDefaults.standard.integer(forKey: "goalValue")
    @Published var goalName = UserDefaults.standard.string(forKey: "goalName")
    @Published var freeMoney = UserDefaults.standard.integer(forKey: "freeMoney")
    @Published var goalPicture = UserDefaults.standard.string(forKey: "goalPicture")
    @Published var beforeMoney = UserDefaults.standard.integer(forKey: "beforeMoney")
}

struct firstLaunchLogic: View {
    
    @AppStorage("isLaunchedBefore") var isLaunchedBefore: Bool = false
    
    var body: some View {
        
        if isLaunchedBefore {
            MainTabView()
        }
        else {
            startView()
        }
        
    }
    
}

struct firstLaunchLogic_Previews: PreviewProvider {
    static var previews: some View {
        firstLaunchLogic()
            .preferredColorScheme(.dark)
    }
}
