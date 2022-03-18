//
//  startSticks.swift
//  SmokingApp
//
//  Created by Андрей Ефимов on 15.03.2022.
//

import SwiftUI
import Combine
import UIKit

struct startSticks: View {
    
    @Binding var sticksShown: Bool
    
    @State var dailyUse: Int = 0
    @State var pricePack = ""
    @State var pricePackInt: Int = 0
    
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
                            
                            Text("Сколько стиков в день вы курите?")
                                .font(.system(size: 19, weight: .heavy))
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.leading)
                                .frame(width: 179, height: 48, alignment: .top)
                                .padding(.trailing, 30)
                                .offset(x: -8, y: 12)
                            
                            Picker("DailyUse", selection: $dailyUse) {
                                ForEach(1..<31) {
                                    Text("\($0)")
                                        .foregroundColor(Color.black)
                                }
                            }.pickerStyle(.wheel)
                                .labelsHidden()
                                .frame(width: 50, height: 32)
                                .clipped()
                                .background((Color.white).opacity(0.9))
                                .cornerRadius(15)
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
                                .background((Color.gray).opacity(0.1))
                                .background((Color.white).opacity(0.9))
                                .cornerRadius(15)
                                .multilineTextAlignment(.center)
                                .offset(x: -1)
                            
                        }
                        
                    }
                    
                    
                    // Hide keyboard invisible button
                    Button(action: {hideKeyboard()}){
                        Rectangle()
                            .frame(width: 375, height: 812)
                            .opacity(0)
                    }

                }
                
            }.offset(y: -22)
            
            
            // Next button
            (Button(action: {
                UserDefaults.standard.set(5, forKey: "score")
                
                pricePackInt = Int(pricePack) ?? 0
                UserDefaults.standard.set(58, forKey: "dailyEconomy")
                
                UserDefaults.standard.set(true, forKey: "isLaunchedBefore")
                UserDefaults.standard.set(Date(), forKey: "savedTime")
                UserDefaults.standard.set(1, forKey: "attempts")
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
            
        }.background(Image("background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 375, height: 812, alignment: .center)
                        .edgesIgnoringSafeArea(.all))
            .overlay(Image("testStartData")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 375, height: 812, alignment: .center)
                        .offset(y: -5)
                        .opacity(0))
        
    }
    
}

struct startSticks_Previews: PreviewProvider {
    static var previews: some View {
        startSticks(sticksShown: .constant(false))
    }
}
