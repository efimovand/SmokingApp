//
//  achievementsView.swift
//  SmokingApp
//
//  Created by Андрей Ефимов on 11.03.2022.
//

import SwiftUI
import Foundation
import Combine

struct achievementsView: View {
    
    @State var height: Float = Float(UIScreen.screenHeight)
    
    var body: some View {

        // Header + Achievements
        VStack(spacing: 0){
            
            // Header
            ZStack{
                
                if height >= 812 {
                    
                Text("Достижения")
                    .foregroundColor(Color.white)
                    .font(.system(size: 28, weight: .heavy))
                    .multilineTextAlignment(.center)
                    .frame(width: 252, height: 52, alignment: .center)
                    .background(Rectangle()
                        .fill(Color(red: 1, green: 1, blue: 1, opacity: 0.40))
                        .ignoresSafeArea()
                        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight * 0.146551724, alignment: .top)
                        .border(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.60), Color(red: 1, green: 1, blue: 1, opacity: 0.30)]), startPoint: .trailing, endPoint: .leading), width: 1)
                        .ignoresSafeArea()
                        .padding(.bottom, UIScreen.screenHeight * 0.0812807882))
                    
                }
                else {
                    
                    Rectangle()
                        .fill(Color(red: 1, green: 1, blue: 1, opacity: 0.40))
                        .frame(width: UIScreen.screenWidth, height: 62)
                        .border(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.60), Color(red: 1, green: 1, blue: 1, opacity: 0.30)]), startPoint: .trailing, endPoint: .leading), width: 1)
                    
                    Text("Достижения")
                        .foregroundColor(Color.white)
                        .font(.system(size: 28, weight: .heavy))
                        .multilineTextAlignment(.center)
                        .frame(width: UIScreen.screenWidth, height: 62, alignment: .center)
                        .offset(y: 5)
                    
                }
                
            }
            
            // Achievements
            ScrollView(.vertical, showsIndicators: false) {
                
                // List
                VStack(spacing: 15) {
                    
                    // 1
                    Group {
                        
                        VStack(spacing: 15) {
                            
                            achievement(name: "Начало положено", description: "Провести 1 день без курения", picture: Image("24hours"), type: -1, value: 24)
                                .padding(.top, 19)
                            
                            achievement(name: "Первые дивиденды", description: "Сэкономить 500Р", picture: Image("coin"), type: 1, value: 500)
                            
                            achievement(name: "Идём на снижение", description: "Провести 3 дня без курения", picture: Image("nicotine"), type: 0, value: 3)
                            
                            achievement(name: "Денежное дерево", description: "Сэкономить 1000Р", picture: Image("moneytree"), type: 1, value: 1000)
                            
                            achievement(name: "Неделя очищения", description: "Провести 7 дней без курения", picture: Image("wings"), type: 0, value: 7)
                            
                            achievement(name: "Спорт это жизнь", description: "Избавиться от одышки", picture: Image("walking_1"), type: 0, value: 1000)
                            
                            achievement(name: "С кем не бывает", description: "Начать вторую попытку", picture: Image("heartballoon"), type: 2, value: 2)
                            
                            achievement(name: "Стонкс", description: "Сэкономить 2500Р", picture: Image("stonks"), type: 1, value: 2500)
                            
                            achievement(name: "Железная выдержка", description: "Провести 14 дней без курения", picture: Image("meditation_2"), type: 0, value: 14)
                            
                            achievement(name: "Красивое зеркало", description: "Восстановить состояние кожи", picture: Image("beauty"), type: 0, value: 1000)
                            
                        }
                    }
                    
                    // 2
                    Group {
                        
                        VStack(spacing: 15) {
                            
                            achievement(name: "Тяжелый бумажник", description: "Сэкономить 5000Р", picture: Image("wallet"), type: 1, value: 5000)
                            
                            achievement(name: "Главное не сдаваться", description: "Начать пятую попытку", picture: Image("firststeps"), type: 2, value: 5)
                            
                            achievement(name: "Спокойной ночи", description: "Восстановить сон", picture: Image("sleep"), type: 0, value: 1000)
                            
                            achievement(name: "Экономист", description: "Сэкономить 10000Р", picture: Image("treasure"), type: 1, value: 10000)
                            
                            achievement(name: "Вдох выдох вдох", description: "Полностью очистить лёгкие от CO2", picture: Image("lungs"), type: 0, value: 1000)
                            
                            achievement(name: "Это победа", description: "Провести 365 дней без курения", picture: Image("win"), type: 0, value: 365)
                                .padding(.bottom, 19)
                            
                        }
                    }
                    
                }
                
                
            }.frame(width: UIScreen.screenWidth, height: height >= 812 ? UIScreen.screenHeight * 0.7881 : UIScreen.screenHeight * 0.8045)
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.top, height >= 812 ? CGFloat(height * 0.084) : CGFloat(height * 0.062))
            .padding(.bottom, UIScreen.screenHeight * 0.113)
            .background(Image("background")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: .infinity, height: .infinity, alignment: .center)
                            .edgesIgnoringSafeArea(.all))
            .statusBar(hidden: height >= 812 ? false : true)
    }
}


// Every achievement's structure (need add)
struct achievement: View {
    
    @EnvironmentObject var data: UserData
    
    var name: String
    var description: String
    var picture: Image
    var type: Int
    var value: Int
    
    var body: some View {
        
        ZStack{
            
            // background
            HStack(alignment: .center, spacing: 0){
                
                // left
                RoundedCorners(tl: 10, tr: 0, bl: 10, br: 0).fill(Color(red: 0.89, green: 0.93, blue: 1, opacity: 0.40))
                    .frame(width: 75, height: 75)
                
                // right
                RoundedCorners(tl: 0, tr: 10, bl: 0, br: 10).fill(Color(red: 1, green: 1, blue: 1, opacity: 0.40))
                    .frame(width: 270, height: 75)
                
            }.frame(width: 345, height: 75)
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.60), Color(red: 1, green: 1, blue: 1, opacity: 0.30)]), startPoint: .trailing, endPoint: .leading), lineWidth: 1))
            
            // text
            VStack(alignment: .leading, spacing: 5) {
                
                // name
                Text(name)
                    .foregroundColor(Color.white)
                    .font(.system(size: 24, weight: .bold))
                    .multilineTextAlignment(.leading)
                    .frame(width: 255, height: 27, alignment: .topLeading)
                
                // description
                Text(description)
                    .foregroundColor(Color.white)
                    .font(.system(size: 14, weight: .semibold))
                    .multilineTextAlignment(.leading)
                    .frame(width: 250, height: 17, alignment: .topLeading)
                
            }.offset(x: 35, y: -10)
            
            // picture
            picture
                .resizable()
                .frame(width: 75, height: 75)
                .offset(x: -135, y: 0)
            
            // progressBar
            if type == 0 {
                ZStack(alignment: .leading){
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .frame(width: 246, height: 10, alignment: .leading)
                        .offset(x: 38, y: 25)
                    
                    if (data.hours + data.beforeScore * 24 >= value * 24) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue)
                            .frame(width: 246, height: 10)
                            .offset(x: 38, y: 25)
                            .opacity(0.6)
                    }
                    else{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue)
                            .frame(width: 246 / CGFloat(value * 24) * (CGFloat(data.hours) + CGFloat(data.beforeScore * 24)), height: 10)
                            .offset(x: 38, y: 25)
                            .opacity(0.6)
                    }
                    
                }.frame(width: 246, height: 10)
            }
            
            else if type == 1 {
                ZStack(alignment: .leading){
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .frame(width: 246, height: 10, alignment: .leading)
                        .offset(x: 38, y: 25)
                    
                    if (data.hours * (data.dailyEconomy / 24) + data.beforeMoney >= value){
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue)
                            .frame(width: 246, height: 10)
                            .offset(x: 38, y: 25)
                            .opacity(0.6)
                    }
                    else {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue)
                            .frame(width: 246 / CGFloat(value) * (CGFloat(data.hours * (data.dailyEconomy / 24) + data.beforeMoney)), height: 10)
                            .offset(x: 38, y: 25)
                            .opacity(0.6)
                    }
                    
                }
            }
            
            else if type == 2 {
                ZStack(alignment: .leading){
                    
                    if (data.attempts >= value){
                        Image(systemName: "checkmark.circle")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color.white)
                            .offset(x: 145, y: 13)
                    }
                    
                }
            }
            
            else if type == -1 {
                ZStack(alignment: .leading){
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .frame(width: 246, height: 10, alignment: .leading)
                        .offset(x: 38, y: 25)
                    
                    if (data.hours + (data.beforeScore * 24) >= value) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue)
                            .frame(width: 246, height: 10)
                            .offset(x: 38, y: 25)
                            .opacity(0.6)
                    }
                    else{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue)
                            .frame(width: 246 / CGFloat(value) * CGFloat(data.hours), height: 10)
                            .offset(x: 38, y: 25)
                            .opacity(0.6)
                    }
                    
                }.frame(width: 246, height: 10)
            }
            
            
        } // +DropShadow
        
    }
    
}


struct achievementsView_Previews: PreviewProvider {
    static var previews: some View {
        achievementsView()
            .environmentObject(UserData())
    }
}
