//
//  resetAlertView.swift
//  SmokingApp
//
//  Created by Андрей Ефимов on 30.03.2022.
//

import SwiftUI

struct resetAlertView: View {
    
    @EnvironmentObject var data: UserData
    
    @Binding var resetAlertShown: Bool
    
    @State var hardReset: Bool = false
    
    var body: some View {
        
        ZStack{
        
        ZStack{
            
            // background
            RoundedRectangle(cornerRadius: 15)
                .fill(Color(red: 1, green: 1, blue: 1, opacity: 0.5))
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
                    .font(.system(size: 19, weight: .bold))
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .frame(width: 234, height: 43, alignment: .center)
                    .offset(y: 10)
                
                Text("Это приведёт к сбросу всего прогресса")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .frame(width: 234, height: 30, alignment: .center)
                    .opacity(0.9)
                    .offset(y: -5)
                
                // buttons
                HStack(spacing: 0){
                    
                    Button(action: {
                        resetAlertShown.toggle()
                        data.alertResetShown.toggle()
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
                        data.alertResetShown.toggle()
                        data.isLaunchedBefore = false
                        UserDefaults.standard.set(false, forKey: "isLaunchedBefore")
                        hardReset.toggle()
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
            
            if hardReset {
                firstLaunchLogic()
            }
            
        }
        
    }
}

struct resetAlertView_Previews: PreviewProvider {
    static var previews: some View {
        resetAlertView(resetAlertShown: .constant(false))
            .preferredColorScheme(.dark)
            .environmentObject(UserData())
    }
}
