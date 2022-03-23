//
//  economyView.swift
//  SmokingApp
//
//  Created by Андрей Ефимов on 11.03.2022.
//

import SwiftUI

struct economyView: View {
    
    @EnvironmentObject var data: UserData
    //@State var score = 5
    //@State var dailyEconomy = 180
    //@State var isGoal = true
    
    @State var goalShown = false
    
    @State var height: Float = Float(UIScreen.screenHeight)
    
    var body: some View {
        
        // Economy
        ZStack{
            
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
                            
                            if (data.dailyEconomy * data.score >= 1000) {
                                Text(String(data.dailyEconomy * data.score))
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 72, weight: .heavy))
                                    .multilineTextAlignment(.center)
                                    .frame(width: 200, height: 90, alignment: .top)
                                    .offset(y: 20)
                                    .padding(.leading, 30)
                            }
                            else if (data.dailyEconomy * data.score >= 100) {
                                Text(String(data.dailyEconomy * data.score))
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 72, weight: .heavy))
                                    .multilineTextAlignment(.center)
                                    .frame(width: 150, height: 90, alignment: .top)
                                    .offset(y: 20)
                                    .padding(.leading, 30)
                            }
                            else if (data.dailyEconomy * data.score >= 10) {
                                Text(String(data.dailyEconomy * data.score))
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 72, weight: .heavy))
                                    .multilineTextAlignment(.center)
                                    .frame(width: 100, height: 90, alignment: .top)
                                    .offset(y: 20)
                                    .padding(.leading, 30)
                            }
                            else {
                                Text(String(data.dailyEconomy * data.score))
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
                     
                     Text(String(data.dailyEconomy))
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
                     
                     Text(String(data.dailyEconomy * 30))
                     .foregroundColor(Color.white)
                     .font(.system(size: 28, weight: .heavy))
                     .frame(width: 100, height: 28, alignment: .leading)
                     
                     }
                     
                     } */
                    
                    if !data.isGoal {
                        
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
                        
                    }
                    
                    else {
                        
                        nowGoal()
                        
                    }
                    
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
                    .offset(y: UIScreen.screenHeight * 0.185)
            }
            
        }
        
        
        
    }
}

struct nowGoal: View {
    
    @EnvironmentObject var data: UserData
    
    @State var offset: CGFloat = 0
    @State var set: Bool = false
    
    var body: some View {
        
        // nowGoal
        VStack(spacing: 0){
            
            ZStack{
                
                // background
                RoundedCorners(tl: 15, tr: 15, bl: 0, br: 0)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.white, Color(red: 1, green: 1, blue: 1, opacity: 0.50)]), startPoint: .top, endPoint: .bottom))
                    .frame(width: 317, height: 80)
                    .opacity(0.4)
                
                HStack(spacing: 15){
                    
                    // picture
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor((Color.white).opacity(0.4))
                        .frame(width: 60, height: 60)
                        .overlay(Text("Фото").foregroundColor(Color.gray).opacity(0.4))
                    
                    VStack(spacing: 16){
                        
                        // name
                        Text(String(data.goalName ?? ""))
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(Color.white)
                        
                        // progressBar
                        ZStack(alignment: .leading){
                            
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                                .frame(width: 210, height: 10, alignment: .leading)
                            
                            if ((data.score * data.dailyEconomy + data.freeMoney) >= data.goalValue){
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.blue)
                                    .frame(width: 210, height: 10)
                                    .opacity(0.6)
                            }
                            else {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.blue)
                                    .frame(width: 210 / CGFloat(data.goalValue) * (CGFloat(data.score * data.dailyEconomy) + CGFloat(data.freeMoney)), height: 10)
                                    .opacity(0.6)
                            }
                            
                        }
                        
                    }
                    
                }
                
                if ((data.score * data.dailyEconomy + data.freeMoney) >= data.goalValue){
                    
                    Image(systemName: "checkmark.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.white)
                        .offset(x: 125, y: -12)
                    
                }
                
            }.offset(y: offset)
                .onTapGesture(perform: {
                    
                    if offset == 0{
                        withAnimation(.linear(duration: 0.35)){
                            self.offset -= 40
                        }
                    }
                    
                    else{
                        withAnimation(.linear(duration: 0.35)){
                            self.offset = 0
                        }
                    }
                    
                })
            
            if offset != 0{
                
                // goalDescription
                ZStack{
                    
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.white, Color(red: 1, green: 1, blue: 1, opacity: 0.50)]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 317, height: 80)
                        .opacity(0.4)
                    
                    VStack(spacing: 5){
                        
                    // remainingTime
                    HStack(spacing: 5){
                        
                        Text("Осталось копить:")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(Color.white)
                        
                        Text("5 дней")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(Color.white)
                        
                    }.padding(.bottom, 5)
                        
                        // freeMoney
                        HStack(spacing: 5){
                            
                            Text("Свободные деньги:")
                                .font(.system(size: 12, weight: .semibold))
                                .foregroundColor(Color.white)
                            
                            Text(String(data.freeMoney))
                                .font(.system(size: 12, weight: .semibold))
                                .foregroundColor(Color.white)
                            
                        }
                        
                        // stepper
                        HStack(spacing: 0){
                            
                            Button(action: {
                                self.data.freeMoney -= 500
                                if data.freeMoney < 0 {
                                    data.freeMoney = 0
                                }
                            }) {
                                
                            RoundedCorners(tl: 15, tr: 0, bl: 15, br: 0)
                                .fill(LinearGradient(gradient: Gradient(colors: [Color.white, Color(red: 1, green: 1, blue: 1, opacity: 0.50)]), startPoint: .top, endPoint: .bottom))
                                .frame(width: 40, height: 20)
                                .opacity(0.6)
                                .overlay(Image(systemName: "minus")
                                            .foregroundColor(Color.white)
                                            .font(.system(size: 16)))
                                
                            }.offset(x: 0.5)
                            
                            Rectangle()
                                .foregroundColor(Color.white)
                                .frame(width: 1, height: 16)
                                .opacity(0.5)
                            
                            Button(action: {
                                self.data.freeMoney += 500
                            }) {
                                
                            RoundedCorners(tl: 0, tr: 15, bl: 0, br: 15)
                                .fill(LinearGradient(gradient: Gradient(colors: [Color.white, Color(red: 1, green: 1, blue: 1, opacity: 0.50)]), startPoint: .top, endPoint: .bottom))
                                .frame(width: 40, height: 20)
                                .opacity(0.6)
                                .overlay(Image(systemName: "plus")
                                            .foregroundColor(Color.white)
                                            .font(.system(size: 16)))
                                
                            }.offset(x: -0.5)
                            
                        }
                        
                    }
                    
                }.offset(y: -40)
                
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
