//
//  economyView.swift
//  SmokingApp
//
//  Created by Андрей Ефимов on 11.03.2022.
//

import SwiftUI

struct economyView: View {

    @State var totalEconomy: Int = 1250
    @State var dailyEconomy = ""
    @State var monthlyEconomy = ""
    
    var body: some View {
        
        ZStack{
            
            /*
            // NavigationBar
            VStack{
                
                Spacer(minLength: 697)
                
                ZStack{
                    
                    HStack{
                        // main
                        Button(action: {
                            self.selected = 0
                        }) {
                            if self.selected == 0
                            {
                                Image("main_a")
                                    .resizable()
                                    .frame(width: 74, height: 74)
                                    .offset(x: 1, y: -1)
                            }
                            else{
                                Image("main")
                                    .resizable()
                                    .frame(width: 74, height: 74)
                                    .offset(x: 1, y: -1)
                            }
                        }
                        
                        Spacer(minLength: 10)
                        
                        // economy
                        Button(action: {
                            self.selected = 1
                        }) {
                            if self.selected == 1
                            {
                                Image("economy_a")
                                    .resizable()
                                    .frame(width: 81, height: 81)
                                    .offset(x: 1, y: -4)
                            }
                            else{
                                Image("economy")
                                    .resizable()
                                    .frame(width: 81, height: 81)
                                    .offset(x: 1, y: -4)
                            }
                        }
                        
                        Spacer(minLength: 10)
                        
                        // achievements
                        Button(action: {
                            self.selected = 2
                        }) {
                            if self.selected == 2
                            {
                                Image("achievements_a")
                                    .resizable()
                                    .frame(width: 73, height: 73)
                                    .offset(x: 1)
                            }
                            else{
                                Image("achievements")
                                    .resizable()
                                    .frame(width: 73, height: 73)
                                    .offset(x: 1)
                            }
                        }
                        
                        Spacer(minLength: 10)
                        
                        // restart
                        Button(action: {
                            self.selected = 3
                        }) {
                            if self.selected == 3
                            {
                                Image("restart_test")
                                    .resizable()
                                    .frame(width: 67, height: 67)
                                    .offset(x: 1)
                            }
                            else{
                                Image("restart")
                                    .resizable()
                                    .frame(width: 67, height: 67)
                                    .offset(x: 1)
                            }
                        }
                    }
                    .padding(.horizontal, 50)
                    .background(RoundedRectangle(cornerRadius: 20)
                                    .fill(Color(red: 1, green: 1, blue: 1, opacity: 0.40))
                                    .frame(width: 377, height: 92)
                                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.50), Color(red: 1, green: 1, blue: 1, opacity: 0.50)]), startPoint: .trailing, endPoint: .leading), lineWidth: 1))
                                    .offset(y: 7))
                }
            }
             */
            
            
            // Economy
            VStack{
                
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
                    
                    Text("\(totalEconomy)")
                        .foregroundColor(Color.white)
                        .font(.system(size: 72, weight: .heavy))
                        .multilineTextAlignment(.center)
                        .frame(width: 356, height: 90, alignment: .top)
                        .offset(y: 20)
                    
                    Text("₽")
                        .foregroundColor(Color.white)
                        .font(.system(size: 48, weight: .bold))
                        .offset(x: 105, y: 25)
                    
                }.offset(y: -56)
                
                // daily+monthly
                VStack{
                    
                    Text("Экономия в день:")
                        .foregroundColor(Color.white)
                        .font(.system(size: 25, weight: .bold))
                        .frame(width: 300, height: 28, alignment: .leading)
                    
                    
                    Text ("Экономия в месяц:")
                        .foregroundColor(Color.white)
                        .font(.system(size: 25, weight: .bold))
                        .frame(width: 300, height: 28, alignment: .leading)
                    
                }.offset(x: -8, y: 70)
                
            }
        }.background(Image("background_economy")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 375, height: 812, alignment: .center)
                        .edgesIgnoringSafeArea(.all))
        
    }
}




struct economyView_Previews: PreviewProvider {
    static var previews: some View {
        economyView()
    }
}
