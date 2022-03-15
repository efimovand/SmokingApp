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
    
    var body: some Scene {
        WindowGroup {
            startCigarettes()
                //.environmentObject(score)
        }
    }
}
