//
//  SmokingAppApp.swift
//  SmokingApp
//
//  Created by Андрей Ефимов on 25.02.2022.
//

import SwiftUI

@main
struct SmokingAppApp: App {
    
    @StateObject var counter = Score()
    
    var body: some Scene {
        WindowGroup {
            MainTabView().environmentObject(counter)
        }
    }
}
