//
//  firstLaunchLogic.swift
//  SmokingApp
//
//  Created by Андрей Ефимов on 16.03.2022.
//

import SwiftUI

import SwiftUI
import Foundation

struct firstLaunchLogic: View {
    
    @AppStorage("firstLaunch") var firstLaunch: Bool = true
    
    var body: some View {
        
        if firstLaunch {
            startView()
        }
        else {
            MainTabView()
        }
        
    }
}

struct firstLaunchLogic_Previews: PreviewProvider {
    static var previews: some View {
        firstLaunchLogic()
            .environmentObject(Score())
            .environmentObject(SData())
    }
}
