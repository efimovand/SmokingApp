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
        
        NavigationView{
            
            ZStack{
                
                /*
                // Header
                ZStack{
                    
                    Rectangle()
                        .fill(Color(red: 1, green: 1, blue: 1, opacity: 0.40))
                        .frame(width: 377, height: 52)
                        .border(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.60), Color(red: 1, green: 1, blue: 1, opacity: 0.30)]), startPoint: .trailing, endPoint: .leading), width: 1)
                        .offset(y: -355)
                    
                    Text("Достижения")
                        .foregroundColor(Color.white)
                        .font(.system(size: 28, weight: .heavy))
                        .multilineTextAlignment(.center)
                        .frame(width: 252, height: 27, alignment: .center)
                        .offset(y: -355)
                    
                }
                 */
                
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
                
                
                // Achievements
                
                /* ScrollView{ */
                    
                    VStack(spacing: 15) {
                        
                        achievement(name: "Начало положено", description: "Провести 1 день без курения", picture: Image("24hours"))
                        
                        achievement(name: "Первые дивиденды", description: "Сэкономить 500Р", picture: Image("coin"))
                        
                        achievement(name: "Идём на снижение", description: "Провести 3 дня без курения", picture: Image("nikotine"))
                        
                        achievement(name: "Денежное дерево", description: "Сэкономить 1000Р", picture: Image("moneytree"))
                        
                        achievement(name: "Неделя очищения", description: "Провести 7 дней без курения", picture: Image("wings"))
                        
                        achievement(name: "Спорт это жизнь", description: "Избавиться от одышки", picture: Image("walking"))
                        
                    }
               /* } */
                
            }.background(Image("background")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 375, height: 812, alignment: .center)
                            .edgesIgnoringSafeArea(.all))
            
        }
    }
}

// Every achievement's structure
struct achievement: View {
    
    var name: String
    var description: String
    var picture: Image
    
    var body: some View {
        
        ZStack{
            
            // right
            RoundedCorners(tl: 0, tr: 10, bl: 0, br: 10).fill(Color(red: 1, green: 1, blue: 1, opacity: 0.40))
                .frame(width: 270, height: 75)
                .offset(x: 40)
            
            // left
            RoundedCorners(tl: 10, tr: 0, bl: 10, br: 0).fill(Color(red: 0.89, green: 0.93, blue: 1, opacity: 0.40))
                .frame(width: 75, height: 75)
                .offset(x: -132)
            
            // text
            VStack(
                alignment: .leading,
                spacing: 5
            ) {
                
                // name
                Text(name)
                    .foregroundColor(Color.white)
                    .font(.system(size: 24, weight: .bold))
                    .multilineTextAlignment(.leading)
                    .frame(width: 252, height: 27, alignment: .topLeading)
                
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
                .offset(x: -133, y: -3)
            
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
