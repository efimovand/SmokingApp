//
//  mapView.swift
//  SmokingApp
//
//  Created by Андрей Ефимов on 06.04.2022.
//

import SwiftUI

struct mapView: View {
    
    @EnvironmentObject var data: UserData // for maxScoreHours
    
    @Binding var mapShown: Bool
    
    @State var testScore: Int = 3
    
    var body: some View {
        
        ZStack{
            
            // background
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white).opacity(0.4)
                .frame(width: 315, height: 430)
                .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.white, lineWidth: 10).frame(width: 325, height: 440).opacity(0.8))
            
            // mapNow
            ScrollView([.horizontal, .vertical] , showsIndicators: true) {
                
                ZStack{
                    
                    // mapBackground
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.red)
                        .frame(width: 900, height: 1200)
                    
                    
                    // 1 day
                    ZStack{
                        
                        Button(action: {
                            print("lungs tapped")
                        }) {
                            
                        Image("lungs")
                            .resizable()
                            .frame(width: 200, height: 200)
                            
                        }
                        
                    }.offset(x: -350, y: 500)
                    .opacity(testScore >= 1 ? 1 : 0)
                    
                    
                    // 2 day
                    ZStack{
                        
                        Button(action: {
                            print("heart tapped")
                        }) {
                            
                        Image("heart_1")
                            .resizable()
                            .frame(width: 200, height: 200)
                            .overlay((testScore > 2 && testScore < 4) ? youHere() : youHere())
                            
                        }
                        
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: 15, height: 50)
                            .rotationEffect(.degrees(45))
                            .offset(x: -65, y: 60)
                        
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: 15, height: 50)
                            .rotationEffect(.degrees(45))
                            .offset(x: -115, y: 105)
                        
                    }.offset(x: -150, y: 350)
                    .opacity(testScore >= 2 ? 1 : 0)
                    

                }.rotationEffect(Angle(degrees: 180))
                    .scaleEffect(x: -1.0, y: 1.0, anchor: .center)
                
            }.frame(width: 315, height: 430)
                .background(Color.red)
                .cornerRadius(10)
                .rotationEffect(Angle(degrees: 180))
                .scaleEffect(x: -1.0, y: 1.0, anchor: .center)
            
            
        }
        
    }
    
}


// maxScore pin
struct youHere: View {
    
    @EnvironmentObject var data: UserData
    
    var body: some View{
        
        ZStack{
            
            // background
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .frame(width: 140, height: 15)
                .opacity(0.6)
            
            // text
            HStack(spacing: 3){
                
                Text("Ваш рекорд: ")
                    .font(.system(size: 11, weight: .bold))
                    .foregroundColor(Color.white)
                
                Text(String(data.maxScoreHours / 24))
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(Color.white)
                
//                Text("дня")
//                    .font(.system(size: 11, weight: .bold))
//                    .foregroundColor(Color.white)
                
                // switch days
                if data.maxScoreHours >= 24 {

                    if ((data.maxScoreHours / 24 != 11) && (data.maxScoreHours / 24 % 10 == 1)){
                        Text("день")
                            .font(.system(size: 11, weight: .bold))
                            .foregroundColor(Color.white)
                    }
                    else if (((data.maxScoreHours / 24 != 12) && (data.maxScoreHours / 24 != 13) && (data.maxScoreHours / 24 != 14)) && ((data.maxScoreHours / 24 % 10 == 2) || (data.maxScoreHours / 24 % 10 == 3) || (data.maxScoreHours / 24 % 10 == 4))){
                        Text("дня")
                            .font(.system(size: 11, weight: .bold))
                            .foregroundColor(Color.white)
                    }
                    else{
                        Text("дней")
                            .font(.system(size: 11, weight: .bold))
                            .foregroundColor(Color.white)
                    }

                }

                // switch hours
                else {

                    if ((data.maxScoreHours  != 11) && (data.maxScoreHours  % 10 == 1)){
                        Text("час")
                            .font(.system(size: 11, weight: .bold))
                            .foregroundColor(Color.white)
                    }
                    else if (((data.maxScoreHours  != 12) && (data.maxScoreHours  != 13) && (data.maxScoreHours  != 14)) && ((data.maxScoreHours  % 10 == 2) || (data.maxScoreHours  % 10 == 3) || (data.maxScoreHours  % 10 == 4))){
                        Text("часа")
                            .font(.system(size: 11, weight: .bold))
                            .foregroundColor(Color.white)
                    }
                    else{
                        Text("часов")
                            .font(.system(size: 11, weight: .bold))
                            .foregroundColor(Color.white)
                    }
                }
                
            }
            
        }.offset(y: -90)
    }
}


struct mapView_Previews: PreviewProvider {
    static var previews: some View {
        mapView(mapShown: .constant(false))
            .environmentObject(UserData())
            .preferredColorScheme(.dark)
    }
}
