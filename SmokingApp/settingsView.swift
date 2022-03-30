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
    
    @State var hardRestart: Bool = false
    @State var isLaunchedBefore = UserDefaults.standard.bool(forKey: "isLaunchedBefore")
    
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
                }) {
                    Image("flagRus")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 45, height: 30, alignment: .center)
                        .clipShape(Capsule())
                }
                
            }.padding(.bottom, 230)
            
            // hard restart
            Button(action: {
                data.isLaunchedBefore = false
                UserDefaults.standard.set(false, forKey: "isLaunchedBefore")
                hardRestart.toggle()
                hapticTouch(power: "medium")
            }) {
                
                ZStack{
                    
                    RoundedRectangle(cornerRadius: 5)
                        .fill((Color.white).opacity(0.5))
                        .frame(width: 230, height: 25)
                    
                    Text("Сброс настроек по умолчанию")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(Color.white)
                    
                }
                
            }.offset(y: 190)
            
        }.frame(width: 311, height: 452)
            
            if hardRestart {
                firstLaunchLogic()
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
