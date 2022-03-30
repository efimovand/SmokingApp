//
//  restartView.swift
//  SmokingApp
//
//  Created by Андрей Ефимов on 11.03.2022.
//

import SwiftUI

struct restartView: View {
    
    @State var alertShown = false
    @State var settingsShown = false
    
    @State var height: Float = Float(UIScreen.screenHeight)
    
    var body: some View {
        
        ZStack{
            
            // Restart
            VStack(spacing: 0){
                
                // topStaticText
                Text("Вы сорвались и покурили?")
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .frame(width: 200, height: 17, alignment: .leading)
                    .padding(.trailing, 91)
                    .padding(.bottom, 5)
                    .offset(y: -1)
                    .opacity(alertShown ? 0.5 : 1)
                
                // Button
                Button(action: {
                    alertShown.toggle()
                    hapticTouch(power: "medium")
                }) {
                    
                    ZStack{
                        
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color(red: 1, green: 1, blue: 1, opacity: 0.40))
                            .frame(width: 293, height: 163)
                            .overlay(RoundedRectangle(cornerRadius: 15).stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.60), Color(red: 1, green: 1, blue: 1, opacity: 0.30)]), startPoint: .trailing, endPoint: .leading), lineWidth: 1))
                            .opacity(alertShown ? 0.2 : 1)
                        
                        Text("Начать заново")
                            .font(.system(size: 36, weight: .bold))
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                            .frame(width: 231, height: 86, alignment: .top)
                            .opacity(alertShown ? 0 : 1)
                        
                    }
                    
                }
                
                // bottomStaticText
                Text("Такое бывает. Просто попробуйте ещё раз.")
                    .font(.system(size: 12.8, weight: .bold))
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .frame(width: 315, height: 17, alignment: .top)
                    .padding(.top, 6)
                    .offset(x: 2, y: -1)
                    .opacity(alertShown ? 0.5 : 1)
                
            }.padding(.bottom, 30)
                .opacity(settingsShown ? 0 : 1)
            
            
            // settingsButton
            Button(action: {
                settingsShown.toggle()
            }) {
                if settingsShown{
                    Image("settings_a")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60, alignment: .center)
                }
                else {
                    Image("settings")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60, alignment: .center)
                }
            }   .padding(.bottom, height >= 812 ? (UIScreen.screenHeight * 0.79) : (UIScreen.screenHeight * 0.82))
                .padding(.leading, UIScreen.screenWidth * 0.8)
            
            // showingAlert
            if alertShown {
                restartAlertView(alertShown: $alertShown)
                    .offset(y: -40)
            }
            
            // showingSettings
            if settingsShown {
                settingsView(settingsShown: $settingsShown)
            }
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image("background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 375, height: .infinity, alignment: .center)
                        .edgesIgnoringSafeArea(.all))
        .statusBar(hidden: height >= 812 ? false : true)
        
    }
}

// function for Haptic Touch
func hapticTouch(power: String) {
    
    if power == "medium" {
        let haptic = UIImpactFeedbackGenerator(style: .medium)
        haptic.impactOccurred()
    }
    else if power == "soft" {
        let haptic = UIImpactFeedbackGenerator(style: .soft)
        haptic.impactOccurred()
    }
    else if power == "light" {
        let haptic = UIImpactFeedbackGenerator(style: .light)
        haptic.impactOccurred()
    }
    else if power == "heavy" {
        let haptic = UIImpactFeedbackGenerator(style: .heavy)
        haptic.impactOccurred()
    }
    else if power == "rigid" {
        let haptic = UIImpactFeedbackGenerator(style: .rigid)
        haptic.impactOccurred()
    }
    
}


struct restartView_Previews: PreviewProvider {
    static var previews: some View {
        restartView()
    }
}
