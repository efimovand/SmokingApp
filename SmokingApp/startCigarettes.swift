//
//  startCigarettes.swift
//  SmokingApp
//
//  Created by Андрей Ефимов on 15.03.2022.
//

import SwiftUI
import Combine

struct startCigarettes: View {
    
    @Binding var cigarettesShown: Bool
    
    @EnvironmentObject var data: UserData
    
    @State var dailyUse: String = ""
    @State var pricePack: String = ""
    
    var body: some View {
        
        ZStack{
            
            // Form + Button
            ZStack{
                
                // Form
                ZStack{
                    
                    // background
                    VStack(spacing: 0){
                        
                        // topBackground
                        RoundedCorners(tl: 15, tr: 15, bl: 0, br: 0)
                            .fill(Color(red: 0.89, green: 0.93, blue: 1, opacity: 0.40))
                            .frame(width: 309, height: 67)
                        
                        // bottomBackground
                        RoundedCorners(tl: 0, tr: 0, bl: 15, br: 15)
                            .fill(Color(red: 1, green: 1, blue: 1, opacity: 0.40))
                            .frame(width: 309, height: 169)
                        
                    }.overlay(RoundedRectangle(cornerRadius: 15).stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.60), Color(red: 1, green: 1, blue: 1, opacity: 0.30)]), startPoint: .topTrailing, endPoint: .bottomLeading), lineWidth: 1))
                    
                    // overlayStroke + dropShadow
                    
                    // tittle
                    Text("Немного расчётов...")
                        .font(.system(size: 22, weight: .heavy))
                        .foregroundColor(Color.white)
                        .frame(width: 250, height: 26, alignment: .leading)
                        .offset(x: -15, y: -87)
                    
                    // data
                    VStack(spacing: 40){
                        
                        // dailyUse
                        HStack(spacing: 0){
                            
                            Text("Сколько сигарет в день вы курите?")
                                .font(.system(size: 19, weight: .heavy))
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.leading)
                                .frame(width: 179, height: 48, alignment: .top)
                                .padding(.trailing, 30)
                                .offset(x: -8, y: 12)
                            
                            TextField("", text: $dailyUse)
                                .keyboardType(.numberPad)
                                .foregroundColor(Color.black)
                                .labelsHidden()
                                .frame(width: 50, height: 32)
                                .clipped()
                                .background((Color.white).opacity(0.6))
                                .cornerRadius(15)
                                .multilineTextAlignment(.center)
                                .offset(x: -1)
                                .offset(x: 5, y: 12)
                            
                            
                        }.padding(.top, 60)
                        
                        // pricePack
                        HStack(spacing: 0){
                            
                            Text("Стоимость одной пачки:")
                                .font(.system(size: 19, weight: .heavy))
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.leading)
                                .frame(width: 190, height: 48, alignment: .leading)
                                .padding(.trailing, 30)
                                .offset(x: -1, y: -1)
                            
                            TextField("", text: $pricePack)
                                .keyboardType(.numberPad)
                                .foregroundColor(Color.black)
                                .labelsHidden()
                                .frame(width: 50, height: 32)
                                .clipped()
                                .background((Color.white).opacity(0.6))
                                .cornerRadius(15)
                                .multilineTextAlignment(.center)
                                .offset(x: -1)
                            
                        }
                        
                    }
                    
                    
                    // Hide keyboard invisible button
                    Button(action: {hideKeyboard()}){
                        Rectangle()
                            .frame(width: .infinity, height: .infinity)
                            .opacity(0)
                    }
                    
                }
                
            }.offset(y: -22)
            
            
            // Next button
            (Button(action: {
                data.score = 0
                data.hours = 0
                UserDefaults.standard.set(0, forKey: "score")
                UserDefaults.standard.set(0, forKey: "hours")
                
                let dailyUseInt = Int(dailyUse) ?? 0
                let pricePackInt = Int(pricePack) ?? 0
                data.dailyEconomy = dailyUseInt * pricePackInt / 20
                UserDefaults.standard.set(dailyUseInt * pricePackInt / 20, forKey: "dailyEconomy")
                
                data.firstDay = true
                data.attempts = 1
                data.isGoal = false
                data.freeMoney = 0
                data.beforeScore = 0
                data.maxScoreHours = 0
                data.beforeMoney = 0
                UserDefaults.standard.set(0, forKey: "beforeScore")
                UserDefaults.standard.set(0, forKey: "maxScoreHours")
                UserDefaults.standard.set(0, forKey: "beforeMoney")
                UserDefaults.standard.set(true, forKey: "isLaunchedBefore")
                UserDefaults.standard.set(true, forKey: "firstDay")
                UserDefaults.standard.set(Date(), forKey: "savedTime")
                UserDefaults.standard.set(Date(), forKey: "savedHours")
                UserDefaults.standard.set(1, forKey: "attempts")
                UserDefaults.standard.set(false, forKey: "isGoal")
                UserDefaults.standard.set(0, forKey: "freeMoney")
            }) {
                ZStack{
                    
                    Circle()
                        .fill(Color(red: 1, green: 1, blue: 1, opacity: 0.40))
                        .frame(width: 50, height: 50)
                        .overlay(Image(systemName: "arrow.right")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 35))
                                    .offset(x: 1, y: -1))
                    
                }
                
            }).offset(y: 140)
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Image("background")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 375, height: .infinity, alignment: .center)
                            .edgesIgnoringSafeArea(.all))
        
    }
    
}

struct startCigarettes_Previews: PreviewProvider {
    static var previews: some View {
        startCigarettes(cigarettesShown: .constant(false))
            .environmentObject(UserData())
    }
}
