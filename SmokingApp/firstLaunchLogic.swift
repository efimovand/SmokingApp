//
//  firstLaunchLogic.swift
//  SmokingApp
//
//  Created by Андрей Ефимов on 16.03.2022.
//

import SwiftUI

import SwiftUI
import Foundation


@MainActor class SData: ObservableObject {
    @Published var score: Int = 1
    @Published var dailyEconomy: Int = UserDefaults.standard.integer(forKey: "dailyEconomy")
    @Published var savedTime = UserDefaults.standard.object(forKey: "savedTime")
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
            .environmentObject(SData())
            .preferredColorScheme(.dark)
    }
}
