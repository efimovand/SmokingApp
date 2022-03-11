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
            
            achievement(name: "На пенек сел", description: "Сэкономить 1000 рублей", picture: Image("economy"))
                .offset(y: -100)
            achievement(name: "Герой России", description: "Ограбить бабку", picture: Image("restart"))
            
        }.background(Image("background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 375, height: 812, alignment: .center)
                        .edgesIgnoringSafeArea(.all))
        
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
                .offset(x: 45)
            
            // left
            RoundedCorners(tl: 10, tr: 0, bl: 10, br: 0).fill(Color(red: 0.89, green: 0.93, blue: 1, opacity: 0.40))
                .frame(width: 75, height: 75)
                .offset(x: -127)
            
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
                    .frame(width: 190, height: 17, alignment: .topLeading)
                
            }.offset(x: 40, y: -10)
            
            // picture
            picture
                .resizable()
                .frame(width: 75, height: 75)
                .offset(x: -128, y: -3)
            
        } // +DropShadow and Stroke
        
    }
    
}




struct achievementsView_Previews: PreviewProvider {
    static var previews: some View {
        achievementsView()
    }
}
