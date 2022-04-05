//
//  mapView.swift
//  SmokingApp
//
//  Created by Андрей Ефимов on 06.04.2022.
//

import SwiftUI

struct mapView: View {
    
    @EnvironmentObject var data: UserData // for beforeScore
    
    @Binding var mapShown: Bool
    
    @State var testScore: Int = 2
    
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


struct mapView_Previews: PreviewProvider {
    static var previews: some View {
        mapView(mapShown: .constant(false))
            .environmentObject(UserData())
            .preferredColorScheme(.dark)
    }
}
