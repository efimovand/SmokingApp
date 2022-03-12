//
//  restartView.swift
//  SmokingApp
//
//  Created by Андрей Ефимов on 11.03.2022.
//

import SwiftUI

struct restartView: View {
    
    @State var selected = 3
    
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
            
            
            // Restart
            ZStack{
                
                // restartButton
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color(red: 1, green: 1, blue: 1, opacity: 0.40))
                    .frame(width: 293, height: 163)
                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.60), Color(red: 1, green: 1, blue: 1, opacity: 0.30)]), startPoint: .trailing, endPoint: .leading), lineWidth: 1))
                
                Text("Начать заново")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .frame(width: 231, height: 86, alignment: .top)
                
                // staticText
                Text("Вы сорвались и покурили?")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .frame(width: 252, height: 24, alignment: .top)
                    .offset(x: -50, y: -92)
                
                Text("Такое бывает. Просто попробуйте ещё раз.")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .frame(width: 315, height: 24, alignment: .top)
                    .offset(y: 98)
                
            }
        }.background(Image("background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 375, height: 812, alignment: .center)
                        .edgesIgnoringSafeArea(.all))
        
    }
}




struct restartView_Previews: PreviewProvider {
    static var previews: some View {
        restartView()
    }
}
