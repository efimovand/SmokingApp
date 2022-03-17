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
    
    @AppStorage("isLaunchedBefore") var isLaunchedBefore: Bool = false
    
    var body: some View {
        
        if isLaunchedBefore {
            startView()
            //MainTabView()
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
