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
                        .frame(width: 1200, height: 1200)
                    
                    
                    // 1 day
                    ZStack{
                        
                        Button(action: {
                            print("lungs tapped")
                        }) {
                            
                        Image("lungs")
                            .resizable()
                            .frame(width: 200, height: 200)
                            
                        }
                        
                    }.offset(x: -450, y: 500)
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
                        
                    }.offset(x: -250, y: 350)
                    .opacity(testScore >= 2 ? 1 : 0)
                    

                }.rotationEffect(Angle(degrees: 180))
                    .scaleEffect(x: -1.0, y: 1.0, anchor: .center)
                
            }.frame(width: 315, height: 430)
                .background(Color.white)
                .cornerRadius(10)
                .rotationEffect(Angle(degrees: 180))
                .scaleEffect(x: -1.0, y: 1.0, anchor: .center)
                .modifier(SomeModifier())
            
            
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


struct mapPoint: View {
    
    @EnvironmentObject var data: UserData
    
    @State var picture: Image
    @State var name: String
    @State var description: String
    @State var textShown: Bool = false
    @State var number1: Int
    @State var number2: Int
    
    @State var ringOpacity: CGFloat = 0.5
    
    @State var testScore: Int = 4
    
    var body: some View{
        
//        if (data.maxScoreHours / 24) >= number 1 {
        if testScore >= number1 {
            
        ZStack{
            
            // bottom ring
            Ellipse()
                .frame(width: 65, height: 35)
                .opacity(0)
                .overlay(Ellipse().stroke(Color("a39cf4"), lineWidth: 15).opacity(ringOpacity).onChange(of: textShown, perform: { value in
                        switch value {
                        case false : withAnimation(.easeIn(duration: 0.2)) { ringOpacity = 0.5 }
                        case true: withAnimation(.easeInOut(duration: 0.3)) { ringOpacity = 1 }
                        }
                }))
            
            // main button
                ZStack{
                    
                    // shape
                    RoundedCorners(tl: 10, tr: 10, bl: 0, br: 0)
                        .fill(Color.red)
                        .opacity(0)
                        .overlay(RoundedCorners(tl: 10, tr: 10, bl: 0, br: 0).stroke(Color.white, lineWidth: 5))
                        .frame(width: 65, height: 65)
                    
                    picture
                        .resizable()
                        .frame(width: 75, height: 75)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).opacity(0.4).frame(width: 65, height: 65).overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 5)))
                    
                    Triangle()
                        .foregroundColor(Color.white)
                        .frame(width: 70.6, height: 20)
                        .rotationEffect(.degrees(180))
                        .offset(y: 45.1)
                    
                }.offset(y: -60)
                .onTapGesture(perform: {
                    textShown.toggle()
                })

            
            if textShown {
                
                VStack(spacing: 0){
                    
                    ZStack{
                        
                        RoundedCorners(tl: 10, tr: 10, bl: 0, br: 0)
                            .fill((Color.white).opacity(0.8))
                            .frame(width: 250, height: 40)
                        
                        Text(name)
                            .font(.system(size: 13, weight: .bold))
                            .frame(width: 250, height: 35, alignment: .center)
                        
                    }
                    
                    ZStack{
                        
                        RoundedCorners(tl: 0, tr: 0, bl: 10, br: 10)
                            .fill((Color.white).opacity(0.6))
                            .frame(width: 250, height: 90)
                        
                        Text(description)
                            .font(.system(size: 11, weight: .semibold))
                            .frame(width: 235, height: 80, alignment: .topLeading)
                        
                        // days value
                        ZStack{
                            
                            // background
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color("a39cf4"))
                                .frame(width: 70, height: 28)
                            
                            // text
                            HStack(spacing: 2){
                                
                                Text(String(number1))
                                    .font(.system(size: 14, weight: .bold))
                                
                                if ((number1 != 11) && (number1 % 10 == 1)){
                                    Text("день")
                                        .font(.system(size: 12, weight: .bold))
                                }
                                else if (((number1 != 12) && (number1 != 13) && (number1 != 14)) && ((number1 % 10 == 2) || (number1 % 10 == 3) || (number1 % 10 == 4))){
                                    Text("дня")
                                        .font(.system(size: 12, weight: .bold))
                                }
                                else{
                                    Text("дней")
                                        .font(.system(size: 12, weight: .bold))
                                }
                                
                            }
                            
                        }.offset(x: 90, y: 30)
                        
                        
                        
                    }
                    
                }.offset(y: -150)
                
            }
            
        }
            
        }
        
        else {
            
            //
            
        }
        
    }
    
}


// triangle shape
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        return path
    }
}


// modifier for disabling ScrollView bounce
struct SomeModifier: ViewModifier {
    init() {
      UIScrollView.appearance().bounces = false
    }

    func body(content: Content) -> some View {
        return content
    }
}

struct mapView_Previews: PreviewProvider {
    static var previews: some View {
//        mapView(mapShown: .constant(false))
//            .environmentObject(UserData())
//            .preferredColorScheme(.dark)
        mapPoint(picture: Image("lungs"), name: "Нормализуется уровень углекислого газа в крови", description: "Организм избавляется от избытка CO2. Повышенное содержание кислорода помогает питать ткани и кровеносные сосуды, которые получали меньше кислорода во время курения.", number1: 4, number2: 6)
            .preferredColorScheme(.dark)
            .environmentObject(UserData())
    }
}
