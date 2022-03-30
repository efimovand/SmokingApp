//
//  nowGoalView.swift
//  SmokingApp
//
//  Created by Андрей Ефимов on 24.03.2022.
//

import SwiftUI

struct nowGoalView: View {
    
    @EnvironmentObject var data: UserData
    
    @State var offset: CGFloat = 0
    @State var set: Bool = false
    @State var alertGoalShown = false
    
    @AppStorage("freeMoney") var freeMoney: Int = 0
    
    var body: some View {
        
        ZStack{
        
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
                        .overlay(Image(data.goalPicture ?? "")
                            .resizable()
                            .frame(width: 60, height: 60))
                    
                    VStack(spacing: 16){
                        
                        // name
                        Text(String(data.goalName ?? " "))
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(Color.white)
                        
                        // progressBar
                        ZStack(alignment: .leading){
                            
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                                .frame(width: 210, height: 10, alignment: .leading)
                            
                            if ((data.score * data.dailyEconomy + data.freeMoney + data.beforeMoney) >= data.goalValue){
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.blue)
                                    .frame(width: 210, height: 10)
                                    .opacity(0.6)
                            }
                            else {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.blue)
                                    .frame(width: 210 / CGFloat(data.goalValue) * (CGFloat(data.score * data.dailyEconomy) + CGFloat(data.freeMoney) + CGFloat(data.beforeMoney)), height: 10)
                                    .opacity(0.6)
                            }
                            
                        }
                        
                    }
                    
                }
                
                // completedPicture
                if ((data.score * data.dailyEconomy + data.freeMoney + data.beforeMoney) >= data.goalValue){
                    
                    Image(systemName: "checkmark.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.white)
                        .offset(x: 125, y: -12)
                    
                }
                
            }.offset(y: offset)
                .onTapGesture(perform: {
                    
                    if offset == 0{
                        withAnimation(.linear(duration: 0.3)){
                            self.offset -= 40
                        }
                    }
                    
                    else{
                        withAnimation(.linear(duration: 0.3)){
                            self.offset = 0
                        }
                    }
                    
                })
            
            // != 0
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
                            
                            if ((data.score * data.dailyEconomy + data.freeMoney + data.beforeMoney) >= data.goalValue) {
                                
                                Text("0")
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundColor(Color.white)
                                
                            }
                            else{
                                
                                Text(String((data.goalValue - data.freeMoney - data.beforeMoney) / data.dailyEconomy))
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundColor(Color.white)
                                
                            }
                            
                            // day word switch
                            if (((data.goalValue - data.freeMoney - data.beforeMoney) / data.dailyEconomy != 11) && ((data.goalValue - data.freeMoney - data.beforeMoney) / data.dailyEconomy % 10 == 1)) {
                                Text("день")
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundColor(Color.white)
                                    .padding(.leading, -2.5)
                            }
                            else if ((((data.goalValue - data.freeMoney - data.beforeMoney) / data.dailyEconomy != 12) && ((data.goalValue - data.freeMoney - data.beforeMoney) / data.dailyEconomy != 13) && ((data.goalValue - data.freeMoney - data.beforeMoney) / data.dailyEconomy != 14)) && (((data.goalValue - data.freeMoney - data.beforeMoney) / data.dailyEconomy % 10 == 2) || ((data.goalValue - data.freeMoney - data.beforeMoney) / data.dailyEconomy % 10 == 3) || ((data.goalValue - data.freeMoney - data.beforeMoney) / data.dailyEconomy % 10 == 4))) {
                                Text("дня")
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundColor(Color.white)
                                    .padding(.leading, -2.5)
                            }
                            else {
                                Text("дней")
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundColor(Color.white)
                                    .padding(.leading, -2.5)
                            }
                            
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
                                data.freeMoney -= 500
                                freeMoney -= 500
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
                                data.freeMoney += 500
                                freeMoney += 500
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
                    
                    // reset Button
                    Button(action: {
                        alertGoalShown.toggle()
                        hapticTouch(power: "medium")
                    }) {
                        Circle()
                            .fill(Color(red: 1, green: 1, blue: 1).opacity(0.2))
                            .frame(width: 25, height: 25)
                            .overlay(Image(systemName: "gobackward")
                                .foregroundColor(Color.white)
                                .font(.system(size: 15))
                                .offset(x: 0.2, y: -0.75))
                            .overlay(Circle().stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.50), Color(red: 1, green: 1, blue: 1, opacity: 0.30)]), startPoint: .topTrailing, endPoint: .bottomLeading), lineWidth: 0.3))
                    }
                    .offset(x: 143, y: 23)
                    
                }.offset(y: -40)
                
            }
            
        }.blur(radius: alertGoalShown ? 3 : 0)
            
            // showingAlert
            if alertGoalShown {
                restartGoalAlertView(alertGoalShown: $alertGoalShown)
                    .offset(y: -220)
            }
            
        }
        
    }
}
    
    
    struct nowGoalView_Previews: PreviewProvider {
        static var previews: some View {
            nowGoalView()
                .environmentObject(UserData())
                .preferredColorScheme(.dark)
        }
    }
