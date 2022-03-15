//
//  startVape.swift
//  SmokingApp
//
//  Created by Андрей Ефимов on 15.03.2022.
//

import SwiftUI
import Combine
import UIKit

struct startVape: View {
    
    @EnvironmentObject var startVapeData: SData
    @State var dailyUse: Int = 1
    @State var intVape: Int = 0
    
    @Binding var vapeShown: Bool
    
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
                        
                    }
                    
                    // overlayStroke + dropShadow
                    
                    // tittle
                    Text("Немного расчётов...")
                        .font(.system(size: 22, weight: .heavy))
                        .foregroundColor(Color.white)
                        .frame(width: 250, height: 26, alignment: .leading)
                        .offset(x: -15, y: -87)
                    
                            // pricePack
                            HStack(spacing: 0){
                                
                                Text("Ваши затраты на жидкость в месяц:")
                                    .font(.system(size: 19, weight: .heavy))
                                    .foregroundColor(Color.white)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: 190, height: 48, alignment: .leading)
                                    .padding(.trailing, 30)
                                    .offset(x: -1, y: -1)
                                
                                TextField("", value: $startVapeData.pricePack, formatter: NumberFormatter())
                                    .keyboardType(.numberPad)
                                    .foregroundColor(Color.black)
                                    .labelsHidden()
                                    .frame(width: 50, height: 32)
                                    .clipped()
                                    .background((Color.gray).opacity(0.1))
                                    .background((Color.white).opacity(0.8))
                                    .cornerRadius(15)
                                    .multilineTextAlignment(.center)
                                    .offset(x: -1)
                                
                            }.offset(y: 25)
                        
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
                UserDefaults.standard.set(dailyUse, forKey: "dailyUse")
                intVape = lroundf(Float(startVapeData.pricePack) / 1.5)
                UserDefaults.standard.set(intVape, forKey: "pricePack")
                UserDefaults.standard.set(false, forKey: "firstLaunch")
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

struct startVape_Previews: PreviewProvider {
    static var previews: some View {
        startVape(vapeShown: .constant(false))
            .environmentObject(SData())
    }
}