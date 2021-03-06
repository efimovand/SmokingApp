//
//  restartAlertView.swift
//  SmokingApp
//
//  Created by Андрей Ефимов on 13.03.2022.
//

import SwiftUI

struct restartAlertView: View {
    
    @EnvironmentObject var data: UserData
    
    @Binding var alertShown: Bool
    
    var body: some View {
        
        ZStack{
            
            // background
            RoundedRectangle(cornerRadius: 15)
                .fill(Color(red: 1, green: 1, blue: 1, opacity: 0.50))
                .frame(width: 232, height: 117)
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
                        hapticTouch(power: "medium")
                    }) {
                        Text("Отмена")
                            .font(.system(size: 13.5, weight: .bold))
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                            .frame(width: 115, height: 34, alignment: .center)
                            .offset(y: 2)
                    }
                    
                    // verticalDivider
                    Rectangle()
                        .frame(width: 2, height: 37.5)
                        .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.40))
                        .offset(y: 3)
                    
                    Button(action: {
                        alertShown.toggle()
                        if data.hours >= data.maxScoreHours {
                            data.maxScoreHours = data.hours
                            UserDefaults.standard.set(data.hours, forKey: "maxScoreHours")
                        }
                        data.attempts += 1
                        data.beforeScore += data.score
                        data.beforeMoney += data.hours * (data.dailyEconomy / 24)
                        data.score = 0
                        data.hours = 0
                        data.firstDay = true
                        UserDefaults.standard.set(data.attempts, forKey: "attempts")
                        UserDefaults.standard.set(data.beforeScore, forKey: "beforeScore")
                        UserDefaults.standard.set(data.beforeMoney, forKey: "beforeMoney")
                        UserDefaults.standard.set(0, forKey: "score")
                        UserDefaults.standard.set(0, forKey: "hours")
                        UserDefaults.standard.set(true, forKey: "firstDay")
                        UserDefaults.standard.set(Date(), forKey: "savedTime")
                        UserDefaults.standard.set(Date(), forKey: "savedHours")
                        hapticTouch(power: "medium")
                    }) {
                        Text("Подтвердить")
                            .font(.system(size: 13.5, weight: .bold))
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                            .frame(width: 115, height: 34, alignment: .center)
                            .offset(y: 2)
                    }
                    
                }
                
            }.frame(width: 234, height: 109)
            
        }.padding(.top, 50)
        
    }
}


struct restartAlertView_Previews: PreviewProvider {
    static var previews: some View {
        restartAlertView(alertShown: .constant(false))
            .preferredColorScheme(.dark)
            .environmentObject(UserData())
    }
}
