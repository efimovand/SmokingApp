//
//  achievementsView.swift
//  SmokingApp
//
//  Created by Андрей Ефимов on 11.03.2022.
//

import SwiftUI

struct achievementsView: View {
    
    @State var selected = 2
    
    var body: some View {
        
        ZStack{
            
            // Header + Achievements
            VStack(spacing: 0){
                
                // Header
                ZStack{
                    
                    Rectangle()
                        .fill(Color(red: 1, green: 1, blue: 1, opacity: 0.40))
                        .frame(width: 377, height: 52)
                        .border(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.60), Color(red: 1, green: 1, blue: 1, opacity: 0.30)]), startPoint: .trailing, endPoint: .leading), width: 1)
                    
                    Text("Достижения")
                        .foregroundColor(Color.white)
                        .font(.system(size: 28, weight: .heavy))
                        .multilineTextAlignment(.center)
                        .frame(width: 252, height: 27, alignment: .center)
                    
                }
                
                
                // Achievements
                ScrollView(.vertical) {
                    
                    // List
                    VStack(spacing: 15) {
                        
                        Group {
                            
                            VStack(spacing: 15) {
                                
                                achievement(name: "Начало положено", description: "Провести 1 день без курения", picture: Image("24hours"))
                                    .padding(.top, 19)
                                
                                achievement(name: "Первые дивиденды", description: "Сэкономить 500Р", picture: Image("coin"))
                                
                                achievement(name: "Идём на снижение", description: "Провести 3 дня без курения", picture: Image("nikotine"))
                                
                                achievement(name: "Денежное дерево", description: "Сэкономить 1000Р", picture: Image("moneytree"))
                                
                                achievement(name: "Неделя очищения", description: "Провести 7 дней без курения", picture: Image("wings"))
                                
                                achievement(name: "Спорт это жизнь", description: "Избавиться от одышки", picture: Image("walking"))
                                
                                achievement(name: "С кем не бывает", description: "Начать вторую попытку", picture: Image("heartballoon"))
                                
                                achievement(name: "Стонкс", description: "Сэкономить 2500Р", picture: Image("stonks"))
                                
                                achievement(name: "Железная выдержка", description: "Провести 14 дней без курения", picture: Image("yoga"))
                                
                                achievement(name: "Красивое зеркало", description: "Восстановить состояние кожи", picture: Image("beauty"))
                                
                            }
                        }
                        
                        Group {
                            
                            VStack(spacing: 15) {
                                
                                achievement(name: "Тяжелый бумажник", description: "Сэкономить 5000Р", picture: Image("wallet"))
                                
                                achievement(name: "Главное не сдаваться", description: "Начать пятую попытку", picture: Image("firststeps"))
                                
                                achievement(name: "Спокойной ночи", description: "Восстановить сон", picture: Image("sleep"))
                                
                                achievement(name: "Экономист", description: "Сэкономить 10000Р", picture: Image("treasure"))
                                
                                achievement(name: "Вдох выдох вдох", description: "Полностью очистить лёгкие от CO2", picture: Image("lungs"))
                                
                                achievement(name: "Это победа", description: "Провести 365 дней без курения", picture: Image("win"))
                                    .padding(.bottom, 19)
                                
                            }
                        }
                    }
                    
                    
                }.frame(width: 375, height: 632)
                
            }.padding(.top, -65)
            
        }.background(Image("background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 375, height: 812, alignment: .center)
                        .edgesIgnoringSafeArea(.all))
        
    }
}


// Every achievement's structure (need add)
struct achievement: View {
    
    var name: String
    var description: String
    var picture: Image
    
    var body: some View {
        
        ZStack{
            
            HStack(alignment: .center, spacing: 0){
                
                // left
                RoundedCorners(tl: 10, tr: 0, bl: 10, br: 0).fill(Color(red: 0.89, green: 0.93, blue: 1, opacity: 0.40))
                    .frame(width: 75, height: 75)
                
                // right
                RoundedCorners(tl: 0, tr: 10, bl: 0, br: 10).fill(Color(red: 1, green: 1, blue: 1, opacity: 0.40))
                    .frame(width: 270, height: 75)
                
            }
            
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
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .frame(width: 246, height: 10)
                .offset(x: 38, y: 25)
            
        } // +DropShadow and Stroke
        
    }
    
}




struct achievementsView_Previews: PreviewProvider {
    static var previews: some View {
        achievementsView()
    }
}
