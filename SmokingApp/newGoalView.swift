//
//  newGoalView.swift
//  SmokingApp
//
//  Created by Андрей Ефимов on 23.03.2022.
//

import SwiftUI

struct newGoalView: View {
    
    @Binding var goalShown: Bool
    
    @State var name = ""
    @State var value = ""
    @State var valueInt: Int = 0
    
    var body: some View {
        
        VStack(spacing: 0){
            
        ZStack{
            
            VStack(spacing: 0){
                
            // background
            RoundedCorners(tl: 15, tr: 15, bl: 0, br: 0)
                .fill(Color(red: 1, green: 1, blue: 1, opacity: 0.70))
                .frame(width: 295, height: 30)
            
            RoundedCorners(tl: 0, tr: 0, bl: 15, br: 15)
                .fill(Color(red: 1, green: 1, blue: 1, opacity: 0.60))
                .frame(width: 295, height: 110)
                
            }.overlay(RoundedRectangle(cornerRadius: 15).stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.60), Color(red: 1, green: 1, blue: 1, opacity: 0.30)]), startPoint: .topTrailing, endPoint: .bottomLeading), lineWidth: 1).frame(width: 295, height: 140))
            
            // Title
            Text("Новая цель")
                .font(.system(size: 22, weight: .semibold))
                .foregroundColor(Color.white)
                .padding(.bottom, 110)
            
            HStack(spacing: 12){
                
                // picture
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor((Color.white).opacity(0.4))
                    .frame(width: 80, height: 80)
                    .overlay(Text("Фото").foregroundColor(Color.gray).opacity(0.4))
                
                // textFields
                VStack(spacing: 5){
                    
                    // name
                    VStack(spacing: 0){
                        
                        Text("Название")
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundColor(Color.white)
                            .frame(width: 170, alignment: .center)
                        
                        TextField("", text: $name)
                            .font(.system(size: 18, weight: .heavy))
                            .foregroundColor(Color.white)
                            .labelsHidden()
                            .background((Color.white).opacity(0.3))
                            .frame(width: 180, height: 25)
                            .clipped()
                            .cornerRadius(50)
                            .multilineTextAlignment(.center)
                        
                    }
                    
                    // value
                    VStack(spacing: 0){
                        
                        Text("Стоимость")
                            .font(.system(size: 11, weight: .semibold))
                            .foregroundColor(Color.white)
                            .frame(width: 170, alignment: .center)
                        
                    TextField("", text: $value)
                        .keyboardType(.numberPad)
                        .font(.system(size: 18, weight: .heavy))
                        .foregroundColor(Color.white)
                        .labelsHidden()
                        .background((Color.white).opacity(0.3))
                        .frame(width: 140, height: 25)
                        .clipped()
                        .cornerRadius(30)
                        .multilineTextAlignment(.center)
                        
                    }
                    
                }.padding(.bottom, 3)
                
            }.padding(.top, 30)
            
            // Quit Button
            Button(action: {
                goalShown.toggle()
            }) {
                
                
                Circle()
                    .fill(Color(red: 1, green: 1, blue: 1).opacity(0.3))
                    .frame(width: 18, height: 18)
                    .overlay(Image(systemName: "multiply")
                        .foregroundColor(Color.white)
                        .font(.system(size: 12)))
                    .overlay(Circle().stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.80), Color(red: 1, green: 1, blue: 1, opacity: 0.50)]), startPoint: .topTrailing, endPoint: .bottomLeading), lineWidth: 0.3))
                
            }.offset(x: 128, y: -55)
            
        }
        
        // Accept Button
        if (name != "") && (value != ""){
            
            Button(action: {
                UserDefaults.standard.set(name, forKey: "goalName")
                valueInt = Int(value) ?? 0
                UserDefaults.standard.set(valueInt, forKey: "goalValue")
                goalShown.toggle()
                UserDefaults.standard.set(true, forKey: "isGoal")
            }) {
                
                ZStack{
                    
                    RoundedCorners(tl: 0, tr: 0, bl: 15, br: 15)
                        .fill(Color(red: 1, green: 1, blue: 1, opacity: 0.70))
                        .frame(width: 150, height: 25)
                    
                    Text("Подтвердить")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor((Color.white).opacity(0.9))
                        .offset(y: -1)
                    
                }
                
            }
            
        }
        
    }
        
    }
}

struct newGoalView_Previews: PreviewProvider {
    static var previews: some View {
        newGoalView(goalShown: .constant(false))
            .preferredColorScheme(.dark)
    }
}
