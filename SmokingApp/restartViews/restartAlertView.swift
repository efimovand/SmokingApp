//
//  restartAlertView.swift
//  SmokingApp
//
//  Created by Андрей Ефимов on 13.03.2022.
//

import SwiftUI

enum clickedButton {
    case ok
    case cancel
    case none
}

struct restartAlertView: View {
    
    // Score var for achievementsAlert
    @EnvironmentObject var alertScore: Score
    
    @Binding var alertShown: Bool
    
    var body: some View {
        
        ZStack{
            
            // background
            RoundedRectangle(cornerRadius: 15)
                .fill(Color(red: 1, green: 1, blue: 1, opacity: 0.50))
                .frame(width: 232, height: 107)
                .overlay(RoundedRectangle(cornerRadius: 15).stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.60), Color(red: 1, green: 1, blue: 1, opacity: 0.30)]), startPoint: .topTrailing, endPoint: .bottomLeading), lineWidth: 1))
            
            // horizontalDivider
            Rectangle()
                .frame(width: 232, height: 2)
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.40))
                .offset(y: 20)
            
            // text
            VStack(spacing: 0){
                
                Text("Вы уверены?")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .frame(width: 234, height: 73, alignment: .center)
                
                // buttons
                HStack(spacing: 0){
                    
                    Button(action: {
                        alertShown.toggle()
                    }) {
                        Text("Отмена")
                            .font(.system(size: 13, weight: .bold))
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                            .frame(width: 115, height: 34, alignment: .center)
                            .offset(y: -1)
                    }
                    
                    // verticalDivider
                    Rectangle()
                        .frame(width: 2, height: 32.5)
                        .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.40))
                        .offset(y: 0.6)
                    
                    Button(action: {
                        alertShown.toggle()
                        self.alertScore.score = 0
                    }) {
                        Text("Подтвердить")
                            .font(.system(size: 13, weight: .bold))
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                            .frame(width: 115, height: 34, alignment: .center)
                            .offset(y: -1)
                    }
                    
                }
                
            }.frame(width: 234, height: 109)
            
        }
        
    }
}


struct restartAlertView_Previews: PreviewProvider {
    static var previews: some View {
        restartAlertView(alertShown: .constant(false))
            .preferredColorScheme(.dark)
            .environmentObject(Score())
    }
}
