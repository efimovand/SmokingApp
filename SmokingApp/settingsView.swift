//
//  settingsView.swift
//  SmokingApp
//
//  Created by Андрей Ефимов on 14.03.2022.
//

import SwiftUI

struct settingsView: View {
    
    @EnvironmentObject var data: UserData
    
    @Binding var settingsShown: Bool
    
    @State var darkMode: Bool = false
    @State var notifications: Bool = true
    
    @State var resetAlertShown = false
    @State var isLaunchedBefore = UserDefaults.standard.bool(forKey: "isLaunchedBefore")
    @State var blurRadius: CGFloat = 0
    
    var body: some View {
        
        ZStack{
            
            ZStack{
                
                // background
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color(red: 1, green: 1, blue: 1, opacity: 0.45))
                    .frame(width: 311, height: 452)
                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.60), Color(red: 1, green: 1, blue: 1, opacity: 0.30)]), startPoint: .topTrailing, endPoint: .bottomLeading), lineWidth: 1))
                
                // darkMode
                Toggle(isOn: $darkMode){
                    
                    Text("Темная тема")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                        .frame(width: 137, height: 23, alignment: .top)
                    
                }   .padding(.horizontal, 10)
                    .offset(y: -180)
                
                // noticications
                Toggle(isOn: $notifications){
                    
                    Text("Уведомления")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                        .frame(width: 150, height: 23, alignment: .top)
                    
                }   .padding(.horizontal, 10)
                    .offset(y: -120)
                
                // language
                HStack(spacing: 100){
                    
                    Text("Язык")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .frame(width: 134, height: 26, alignment: .top)
                        .padding(.trailing, 5)
                    
                    Button(action: {
                        // change language
                        hapticTouch(power: "medium")
                    }) {
                        Image("flagRus")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 45, height: 30, alignment: .center)
                            .clipShape(Capsule())
                    }
                    
                }.padding(.bottom, 105)
                
                // hard reset
                Button(action: {
                    data.alertResetShown.toggle()
                    resetAlertShown.toggle()
                    hapticTouch(power: "medium")
                }) {
                    
                    ZStack{
                        
                        RoundedRectangle(cornerRadius: 5)
                            .fill((Color.white).opacity(0.35))
                            .frame(width: 230, height: 25)
                        
                        Text("Сброс настроек по умолчанию")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(Color.white)
                        
                    }
                    
                }.offset(y: 200)
                
            }.frame(width: 311, height: 452)
                .blur(radius: blurRadius)
                .onChange(of: data.alertResetShown, perform: { value in
                    switch value {
                    case false : withAnimation { blurRadius = 0 }
                    case true: withAnimation { blurRadius = 3 }
                    }
                })
            
            // showingResetAlert
            if resetAlertShown {
                resetAlertView(resetAlertShown: $resetAlertShown)
                    .offset(y: -40)
            }
            
        }
        
    }
}

struct settingsView_Previews: PreviewProvider {
    static var previews: some View {
        settingsView(settingsShown: .constant(false))
            .environmentObject(UserData())
            .preferredColorScheme(.dark)
    }
}
