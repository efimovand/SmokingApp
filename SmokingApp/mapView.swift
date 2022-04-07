//
//  mapView.swift
//  SmokingApp
//
//  Created by Андрей Ефимов on 06.04.2022.
//

import SwiftUI

struct mapView: View {
    
    @EnvironmentObject var data: UserData
    
    @Binding var mapShown: Bool
    
    var body: some View {
        
        ZStack{
            
            // background
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white).opacity(0.4)
                .frame(width: 315, height: 430)
                .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.white, lineWidth: 10).frame(width: 325, height: 440).opacity(0.8))
            
            // mapNow
            ScrollView([.horizontal, .vertical] , showsIndicators: false) {
                
                ZStack{
                    
                    // mapBackground
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.pink)
                        .frame(width: 1200, height: 1200)
                    
                    
                    mapPointHours(picture: Image("heartrate"), name: "Нормализуется частота сердечных сокращений", description: "Волокна в бронхах, которые ранее плохо функционировали из-за постоянного воздействия дыма, снова начнут двигаться. Эти волокна помогают выводить раздражители и бактерии из легких, снижая риск заражения", number: 1).offset(x: -460, y: 520)
                    
                    mapPointHours(picture: Image("co2"), name: "Нормализуется уровень углекислого газа в крови", description: "Организм избавляется от избытка CO2. Повышенное содержание кислорода помогает питать ткани и кровеносные сосуды, которые получали меньше кислорода во время курения", number: 12).offset(x: -320, y: 440)
                    
                    mapPoint(picture: Image("heart_3"), name: "Снижается риск развития инфаркта", description: "Это связано с нормализацией артериального давления и улучшением кислородного обмена. Вам становится легче выполнять упражнения и переносить физическую нагрузку", number: 1).offset(x: -182, y: 356)
                    
                    mapPoint(picture: Image("pizza"), name: "Вкусы и запахи становятся ярче", description: "В этот период восстанавливаются поврежденные дымом нервные окончания", number: 2).offset(x: 14, y: 428)
                    
                    mapPoint(picture: Image("wings"), name: "Дышать становится легче", description: "Бронхи внутри легких начали расслабляться и открываться больше. Это облегчает обмен воздуха между углекислым газом и кислородом. Кроме того, способность легких наполняться воздухом возрастает", number: 3).offset(x: 250, y: 260)
                    
                    mapPoint(picture: Image("nicotine"), name: "Запасы никотина в организме истощаются", description: "Вы можете стать более раздражительным, может возникать головная боль, но это все — признаки восстановления организма", number: 4).offset(x: 370, y: 150)
                    
                    //mapPin().offset(x: -460, y: 520)
                    
                    // lines
                    ZStack{
                        
                        // 1 stack
                        ZStack{
                            
                            // 1 (> 1 hour)
                            Line()
                                .frame(width: 160, height: 40)
                                .scaleEffect(0.24)
                                .rotationEffect(.degrees(-40))
                                .offset(x: -3, y: 20)
                                .foregroundColor(data.maxScoreHours > 1 ? Color.white : Color.gray)
                            
                            // 2 (> 6 hours)
                            Line()
                                .frame(width: 160, height: 40)
                                .scaleEffect(0.24)
                                .scaleEffect(y: -1)
                                .rotationEffect(.degrees(-40))
                                .offset(x: 29, y: -10)
                                .foregroundColor(data.maxScoreHours > 6 ? Color.white : Color.gray)
                            
                        }.offset(x: -400, y: 480)
                        
                        // 2 stack
                        ZStack{
                            
                            // 1 (> 12 hours)
                            Line()
                                .frame(width: 150, height: 132)
                                .scaleEffect(0.24)
                                .scaleEffect(y: 0.3)
                                .rotationEffect(.degrees(-43))
                                .offset(x: -16, y: -6)
                                .foregroundColor(data.maxScoreHours > 12 ? Color.white : Color.gray)
                            
                            // 2 (> 18 hours)
                            Line()
                                .frame(width: 150, height: 134)
                                .scaleEffect(0.24)
                                .scaleEffect(y: 0.3)
                                .scaleEffect(y: -1)
                                .rotationEffect(.degrees(-43))
                                .offset(x: 15, y: -36)
                                .foregroundColor(data.maxScoreHours > 18 ? Color.white : Color.gray)
                            
                        }.offset(x: -250, y: 420)
                        
                        // 3 stack
                        ZStack{
                            
                            // 1 (> 24 hours)
                            Line()
                                .frame(width: 82, height: 145)
                                .scaleEffect(0.45)
                                .scaleEffect(y: 0.15)
                                .rotationEffect(.degrees(25))
                                .offset(x: 27, y: -45)
                                .foregroundColor(data.maxScoreHours > 24 ? Color.white : Color.gray)
                            
                            // 2 (> 32 hours)
                            Line()
                                .frame(width: 80, height: 145)
                                .scaleEffect(0.45)
                                .scaleEffect(y: 0.15)
                                .scaleEffect(y: -1)
                                .rotationEffect(.degrees(25))
                                .offset(x: 66, y: -28)
                                .foregroundColor(data.maxScoreHours > 32 ? Color.white : Color.gray)
                            
                            
                            // 3 (> 40 hours)
                            Line()
                                .frame(width: 82, height: 145)
                                .scaleEffect(0.45)
                                .scaleEffect(y: 0.15)
                                .rotationEffect(.degrees(25))
                                .offset(x: 104, y: -9)
                                .foregroundColor(data.maxScoreHours > 40 ? Color.white : Color.gray)
                            
                        }.offset(x: -150, y: 420)
                        
                    }
                    
                    
                }.rotationEffect(Angle(degrees: 180))
                    .scaleEffect(x: -1.0, y: 1.0, anchor: .center)
                
            }.frame(width: 315, height: 430)
                .cornerRadius(10)
                .rotationEffect(Angle(degrees: 180))
                .scaleEffect(x: -1.0, y: 1.0, anchor: .center)
                .modifier(SomeModifier())
            
            
        }
        
    }
    
}


// maxScore pin
struct mapPin: View {
    
    @EnvironmentObject var data: UserData
    
    @State var pinShown: Bool = false
    
    var body: some View{
        
        ZStack{
            
            Button(action: {
                pinShown.toggle()
            }) {
                
                Image("pin")
                    .resizable()
                    .frame(width: 60, height: 60)
                
            }
            
            if pinShown{
                
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
                    
                }.offset(y: -35)
                
            }
            
        }
        
    }
}


struct mapPoint: View {
    
    @EnvironmentObject private var data: UserData
    
    @State var picture: Image
    @State var name: String
    @State var description: String
    @State var number: Int
    
    @State private var textShown: Bool = false
    @State private var ringOpacity: CGFloat = 0.5
//  @State private var testScore: Int = 3
    
    var body: some View{
        
        if (data.maxScoreHours / 24) >= number {
//                    if testScore >= number {
            
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
                
                
                // unlocked
                if textShown {
                    
                    ZStack{
                        
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
                                        
                                        Text(String(number))
                                            .font(.system(size: 14, weight: .bold))
                                        
                                        if ((number != 11) && (number % 10 == 1)){
                                            Text("день")
                                                .font(.system(size: 12, weight: .bold))
                                        }
                                        else if (((number != 12) && (number != 13) && (number != 14)) && ((number % 10 == 2) || (number % 10 == 3) || (number % 10 == 4))){
                                            Text("дня")
                                                .font(.system(size: 12, weight: .bold))
                                        }
                                        else{
                                            Text("дней")
                                                .font(.system(size: 12, weight: .bold))
                                        }
                                        
                                    }
                                    
                                }.offset(x: 90, y: 31)
                                
                                
                                
                            }
                            
                        }.offset(y: -165)
                        
                        Button(action: {
                            textShown = false
                        }) {
                            Rectangle()
                                .frame(width: .infinity, height: .infinity)
                                .opacity(0)
                        }
                        
                    }
                    
                }
                
            }
            
        }
        
        // locked
        else {
            
            ZStack{
                
                // bottom ring
                Ellipse()
                    .frame(width: 65, height: 35)
                    .opacity(0)
                    .overlay(Ellipse().stroke(Color.gray, lineWidth: 15).opacity(ringOpacity).onChange(of: textShown, perform: { value in
                        switch value {
                        case false : withAnimation(.easeIn(duration: 0.2)) { ringOpacity = 0.7 }
                        case true: withAnimation(.easeInOut(duration: 0.3)) { ringOpacity = 0.3 }
                        }
                    }))
                    .onTapGesture(perform: {
                        textShown.toggle()
                    })
                
                if textShown {
                    
                    ZStack{
                        
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.gray)
                                .frame(width: 100, height: 30)
                                .opacity(0.8)
                            
                            HStack(spacing: 8){
                                
                                Image(systemName: "lock.fill")
                                    .resizable()
                                    .frame(width: 16, height: 21)
                                
                                // days value
                                HStack(spacing: 3){
                                    
                                    Text(String(number))
                                        .font(.system(size: 19, weight: .bold))
                                    
                                    if ((number != 11) && (number % 10 == 1)){
                                        Text("день")
                                            .font(.system(size: 18, weight: .bold))
                                    }
                                    else if (((number != 12) && (number != 13) && (number != 14)) && ((number % 10 == 2) || (number % 10 == 3) || (number % 10 == 4))){
                                        Text("дня")
                                            .font(.system(size: 18, weight: .bold))
                                    }
                                    else{
                                        Text("дней")
                                            .font(.system(size: 18, weight: .bold))
                                    }
                                    
                                }
                                
                            }
                            
                        }.onTapGesture(perform: {
                            textShown.toggle()
                        })
                        .offset(y: -55)
                        
                        Button(action: {
                            textShown = false
                        }) {
                            Rectangle()
                                .frame(width: .infinity, height: .infinity)
                                .opacity(0)
                        }
                        
                    }
                    
                }
                
            }
            
        }
        
    }
    
}


struct mapPointHours: View {
    
    @EnvironmentObject private var data: UserData
    
    @State var picture: Image
    @State var name: String
    @State var description: String
    @State var number: Int
    
    @State private var textShown: Bool = false
    @State private var ringOpacity: CGFloat = 0.5
//    @State private var testScore: Int = 12
    
    var body: some View{
        
        if data.maxScoreHours >= number {
//                    if testScore >= number {
            
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
                
                
                // unlocked
                if textShown {
                    
                    ZStack{
                        
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
                                        
                                        Text(String(number))
                                            .font(.system(size: 13.5, weight: .bold))
                                        
                                        if ((number != 11) && (number % 10 == 1)){
                                            Text("час")
                                                .font(.system(size: 13, weight: .bold))
                                        }
                                        else if (((number != 12) && (number != 13) && (number != 14)) && ((number % 10 == 2) || (number % 10 == 3) || (number % 10 == 4))){
                                            Text("часа")
                                                .font(.system(size: 13, weight: .bold))
                                        }
                                        else{
                                            Text("часов")
                                                .font(.system(size: 13, weight: .bold))
                                        }
                                        
                                    }
                                    
                                }.offset(x: 90, y: 31)
                                
                                
                                
                            }
                            
                        }.offset(y: -165)
                        
                        Button(action: {
                            textShown = false
                        }) {
                            Rectangle()
                                .frame(width: .infinity, height: .infinity)
                                .opacity(0)
                        }
                        
                    }
                    
                }
                
            }
            
        }
        
        // locked
        else {
            
            ZStack{
                
                // bottom ring
                Ellipse()
                    .frame(width: 65, height: 35)
                    .opacity(0)
                    .overlay(Ellipse().stroke(Color.gray, lineWidth: 15).opacity(ringOpacity).onChange(of: textShown, perform: { value in
                        switch value {
                        case false : withAnimation(.easeIn(duration: 0.2)) { ringOpacity = 0.7 }
                        case true: withAnimation(.easeInOut(duration: 0.3)) { ringOpacity = 0.3 }
                        }
                    }))
                    .onTapGesture(perform: {
                        textShown.toggle()
                    })
                
                if textShown {
                    
                    ZStack{
                        
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.gray)
                                .frame(width: 100, height: 30)
                                .opacity(0.8)
                            
                            HStack(spacing: 5){
                                
                                Image(systemName: "lock.fill")
                                    .resizable()
                                    .frame(width: 16, height: 21)
                                
                                // days value
                                HStack(spacing: 2){
                                    
                                    Text(String(number))
                                        .font(.system(size: 16, weight: .bold))
                                    
                                    if ((number != 11) && (number % 10 == 1)){
                                        Text("час")
                                            .font(.system(size: 15, weight: .bold))
                                    }
                                    else if (((number != 12) && (number != 13) && (number != 14)) && ((number % 10 == 2) || (number % 10 == 3) || (number % 10 == 4))){
                                        Text("часа")
                                            .font(.system(size: 15, weight: .bold))
                                    }
                                    else{
                                        Text("часов")
                                            .font(.system(size: 15, weight: .bold))
                                    }
                                    
                                }
                                
                            }
                            
                        }.onTapGesture(perform: {
                            textShown.toggle()
                        })
                        .offset(y: -55)
                        
                        Button(action: {
                            textShown = false
                        }) {
                            Rectangle()
                                .frame(width: .infinity, height: .infinity)
                                .opacity(0)
                        }
                        
                    }
                    
                }
                
            }
            
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

// line shape
struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint.zero)
        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.minY), control: CGPoint(x: rect.midX, y: rect.minY + 70))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addQuadCurve(to: CGPoint(x: 0, y: rect.maxY), control: CGPoint(x: rect.midX, y: rect.maxY + 70))
        path.closeSubpath()
        
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
                mapView(mapShown: .constant(false))
                    .environmentObject(UserData())
                    .preferredColorScheme(.dark)
        
        //        mapPoint(picture: Image("lungs"), name: "Нормализуется уровень углекислого газа в крови", description: "Организм избавляется от избытка CO2. Повышенное содержание кислорода помогает питать ткани и кровеносные сосуды, которые получали меньше кислорода во время курения.", number: 4)
        //            .preferredColorScheme(.dark)
        //            .environmentObject(UserData())
        
//        mapPin()
//            .environmentObject(UserData())
//            .preferredColorScheme(.dark)
        
//        Line()
//            .frame(height: 300)
//            .preferredColorScheme(.dark)
    }
}
