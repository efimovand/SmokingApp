//
//  economyView.swift
//  SmokingApp
//
//  Created by Андрей Ефимов on 11.03.2022.
//

import SwiftUI

struct economyView: View {
    
    //@EnvironmentObject var data: UserData
    @State var score = 5
    @State var dailyEconomy = 180
    
    @State var goalShown = false
    
    @State var height: Float = Float(UIScreen.screenHeight)
    
    var body: some View {
        
        ZStack{
            
            // Economy
            ZStack{
                
                VStack(spacing: 130){
                    
                    Spacer(minLength: UIScreen.screenHeight * 0.095)
                    
                    // totalEconomy
                    ZStack{
                        
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color(red: 1, green: 1, blue: 1, opacity: 0.40))
                            .frame(width: 326, height: 227)
                            .overlay(RoundedRectangle(cornerRadius: 15).stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.60), Color(red: 1, green: 1, blue: 1, opacity: 0.30)]), startPoint: .topTrailing, endPoint: .bottomLeading), lineWidth: 1))
                        
                        Text("Вы сохранили")
                            .foregroundColor(Color.white)
                            .font(.system(size: 40, weight: .bold))
                            .frame(width: 276, height: 55, alignment: .topLeading)
                            .offset(y: -50)
                        
                        HStack(spacing: 0){
                            
                            if (dailyEconomy * score >= 1000) {
                                Text(String(dailyEconomy * score))
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 72, weight: .heavy))
                                    .multilineTextAlignment(.center)
                                    .frame(width: 200, height: 90, alignment: .top)
                                    .offset(y: 20)
                                    .padding(.leading, 30)
                            }
                            else if (dailyEconomy * score >= 100) {
                                Text(String(dailyEconomy * score))
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 72, weight: .heavy))
                                    .multilineTextAlignment(.center)
                                    .frame(width: 150, height: 90, alignment: .top)
                                    .offset(y: 20)
                                    .padding(.leading, 30)
                            }
                            else if (dailyEconomy * score >= 10) {
                                Text(String(dailyEconomy * score))
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 72, weight: .heavy))
                                    .multilineTextAlignment(.center)
                                    .frame(width: 100, height: 90, alignment: .top)
                                    .offset(y: 20)
                                    .padding(.leading, 30)
                            }
                            else {
                                Text(String(dailyEconomy * score))
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 72, weight: .heavy))
                                    .multilineTextAlignment(.center)
                                    .frame(width: 50, height: 90, alignment: .top)
                                    .offset(y: 20)
                                    .padding(.leading, 30)
                            }
                            
                            Text("₽")
                                .foregroundColor(Color.white)
                                .font(.system(size: 48, weight: .bold))
                                .offset(y: 25)
                            
                        }
                        
                    }.offset(y: -56)
                    
                    /*
                    // daily+monthly
                    VStack(spacing: 3){
                        
                        HStack{
                            
                            Text("Экономия в день:")
                                .foregroundColor(Color.white)
                                .font(.system(size: 25, weight: .bold))
                                .frame(width: 220, height: 28, alignment: .leading)
                            
                            Text(String(dailyEconomy))
                                .foregroundColor(Color.white)
                                .font(.system(size: 28, weight: .heavy))
                                .frame(width: 70, height: 28, alignment: .trailing)
                            
                        }
                        
                        
                        HStack{
                            
                            Text("Экономия в месяц:")
                                .foregroundColor(Color.white)
                                .font(.system(size: 25, weight: .bold))
                                .frame(width: 240, height: 28, alignment: .leading)
                                .padding(.leading, 30)
                            
                            Text(String(dailyEconomy * 30))
                                .foregroundColor(Color.white)
                                .font(.system(size: 28, weight: .heavy))
                                .frame(width: 100, height: 28, alignment: .leading)
                            
                        }
                        
                    } */
                    
                    // Goal Button
                    Button(action: {
                        goalShown.toggle()
                    }) {
                        
                        Circle()
                            .fill(Color(red: 1, green: 1, blue: 1, opacity: 0.40))
                            .frame(width: 55, height: 55)
                            .overlay(Circle().stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.60), Color(red: 1, green: 1, blue: 1, opacity: 0.30)]), startPoint: .topTrailing, endPoint: .bottomLeading), lineWidth: 0.50))
                            .overlay(Image("target")
                                .resizable()
                                .frame(width: 55, height: 55))
                        
                    }.padding(.trailing, 285)
                        .offset(y: 30)
                    
                    Spacer()
                    
                }.padding(.top, 60)
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Image("background_economy")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: .infinity, height: .infinity, alignment: .center)
                    .edgesIgnoringSafeArea(.all))
                .statusBar(hidden: height >= 812 ? false : true)
                .blur(radius: goalShown ? 3 : 0)
            
            if goalShown {
                newGoalView(goalShown: $goalShown)
                    .offset(y: 150)
            }
            
        }
        
        
        
    }
}


struct economyView_Previews: PreviewProvider {
    static var previews: some View {
        economyView()
            .environmentObject(UserData())
    }
}
