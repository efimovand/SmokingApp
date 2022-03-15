//
//  economyView.swift
//  SmokingApp
//
//  Created by Андрей Ефимов on 11.03.2022.
//

import SwiftUI

struct economyView: View {
    
    @State var totalEconomy: Int = 1250
    @State var dailyEconomy: Int = 350
    @State var monthlyEconomy: Int = 10500
    
    var body: some View {
        
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
                    
                    Text(String(totalEconomy))
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
                    
                    HStack{
                        
                        Text("Экономия в день:")
                            .foregroundColor(Color.white)
                            .font(.system(size: 25, weight: .bold))
                            .frame(width: 220, height: 28, alignment: .leading)
                        
                        Text(String(dailyEconomy))
                            .foregroundColor(Color.white)
                            .font(.system(size: 25, weight: .bold))
                            .frame(width: 70, height: 28, alignment: .trailing)
                        
                    }
                    
                    
                    HStack{
                        
                        Text("Экономия в месяц:")
                            .foregroundColor(Color.white)
                            .font(.system(size: 25, weight: .bold))
                            .frame(width: 240, height: 28, alignment: .leading)
                        
                        Text(String(monthlyEconomy))
                            .foregroundColor(Color.white)
                            .font(.system(size: 25, weight: .bold))
                            .frame(width: 80, height: 28, alignment: .trailing)
                        
                    }
                    
                }.offset(x: -8, y: 70)
                
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
