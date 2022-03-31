//
//  ContentView.swift
//  SmokingApp
//
//  Created by Андрей Ефимов on 25.02.2022.
//

import SwiftUI
import Foundation

struct mainView: View {
    
    @EnvironmentObject var data: UserData
    
    @State var savedHours = UserDefaults.standard.object(forKey: "savedHours") as! Date
    @State var saved = UserDefaults.standard.object(forKey: "savedTime") as! Date
    @State var now = Date()
    
    @State var height: Float = Float(UIScreen.screenHeight)
    
    // List of healthNow
    @State var healthCase = [
        healthNow(text: "Нормализуется частота сердечных сокращений, начинает снижаться артериальное давление", picture: Image("heartrate"), description: "Волокна в бронхах, которые ранее плохо функционировали из-за постоянного воздействия дыма, снова начнут двигаться. Эти волокна помогают выводить раздражители и бактерии из легких, снижая риск заражения."),
        
        healthNow(text: "Нормализуется уровень углекислого газа в крови, улучшается снабжение тканей кислородом", picture: Image("co2"), description: "Организм избавляется от избытка CO2. Повышенное содержание кислорода помогает питать ткани и кровеносные сосуды, которые получали меньше кислорода во время курения."),
        
        healthNow(text: "Снижается риск развития инфаркта", picture: Image("heart_3"), description: "Это связано с нормализацией артериального давления и улучшением кислородного обмена. Вам становится легче выполнять упражнения и переносить физическую нагрузку")
    ]
    
    var body: some View {
        
        ZStack{
            
            // Main
            VStack(spacing: 0){
                
                if data.firstDay {
                    
                    //textTop
                    Text("Вы не курите уже")
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(Color.white)
                        .frame(width: 354, height: 115, alignment: .topLeading)
                        .padding(.leading, 20)
                    
                    //score
                    if (data.hours < 10){
                        Text("\(data.hours)")
                            .font(.system(size: 288, weight: .heavy))
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                            .frame(width: 200, height: 200, alignment: .center)
                            .padding()
                    }
                    else if (data.hours >= 10 && data.hours < 100){
                        Text("\(data.hours)")
                            .font(.system(size: 250, weight: .heavy))
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                            .frame(width: 340, height: 200, alignment: .center)
                            .padding()
                    }
                    
                    //textBottom
                    if ((data.hours != 11) && (data.hours % 10 == 1)){
                        Text("час")
                            .font(.system(size: 48, weight: .bold))
                            .foregroundColor(Color.white)
                            .frame(width: UIScreen.screenWidth, height: 0)
                            .padding(.leading, 155)
                            .padding(.top, 25)
                    }
                    else if (((data.hours != 12) && (data.hours != 13) && (data.hours != 14)) && ((data.hours % 10 == 2) || (data.hours % 10 == 3) || (data.hours % 10 == 4))){
                        Text("часа")
                            .font(.system(size: 48, weight: .bold))
                            .foregroundColor(Color.white)
                            .frame(width: UIScreen.screenWidth, height: 0)
                            .padding(.leading, 155)
                            .padding(.top, 25)
                    }
                    else{
                        Text("часов")
                            .font(.system(size: 48, weight: .bold))
                            .foregroundColor(Color.white)
                            .frame(width: UIScreen.screenWidth, height: 0)
                            .padding(.leading, 155)
                            .padding(.top, 25)
                    }
                    
                }
                
                else {
                    
                    //textTop
                    Text("Вы не курите уже")
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(Color.white)
                        .frame(width: 354, height: 115, alignment: .topLeading)
                        .padding(.leading, 20)
                    
                    //score
                    if (data.score < 10){
                        Text("\(data.score)")
                            .font(.system(size: 288, weight: .heavy))
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                            .frame(width: 200, height: 200, alignment: .center)
                            .padding()
                    }
                    else if (data.score >= 10 && data.score < 100){
                        Text("\(data.score)")
                            .font(.system(size: 250, weight: .heavy))
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                            .frame(width: 340, height: 200, alignment: .center)
                            .padding()
                    }
                    else if (data.score >= 100){
                        Text("\(data.score)")
                            .font(.system(size: 170, weight: .heavy))
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                            .frame(width: 350, height: 200, alignment: .center)
                            .padding()
                    }
                    
                    //textBottom
                    if ((data.score != 11) && (data.score % 10 == 1)){
                        Text("день")
                            .font(.system(size: 48, weight: .bold))
                            .foregroundColor(Color.white)
                            .frame(width: UIScreen.screenWidth, height: 0)
                            .padding(.leading, 155)
                            .padding(.top, 25)
                    }
                    else if (((data.score != 12) && (data.score != 13) && (data.score != 14)) && ((data.score % 10 == 2) || (data.score % 10 == 3) || (data.score % 10 == 4))){
                        Text("дня")
                            .font(.system(size: 48, weight: .bold))
                            .foregroundColor(Color.white)
                            .frame(width: UIScreen.screenWidth, height: 0)
                            .padding(.leading, 155)
                            .padding(.top, 25)
                    }
                    else{
                        Text("дней")
                            .font(.system(size: 48, weight: .bold))
                            .foregroundColor(Color.white)
                            .frame(width: UIScreen.screenWidth, height: 0)
                            .padding(.leading, 155)
                            .padding(.top, 25)
                    }
                    
                }
                
                
            }
            .offset(y: height >= 812 ? -UIScreen.screenHeight * 0.09 : -UIScreen.screenHeight * 0.12)
            .blur(radius: data.healthShown ? 3 : 0)
            
            Spacer(minLength: UIScreen.screenHeight * 0.09)
            
            //healthNow
            switch data.score{
                
            case 0:
                healthCase[0]
            case 1...1000:
                healthCase[1]
            default:
                Text("")
                
            }
            
        }.ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image("background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.screenWidth, height: .infinity, alignment: .center)
                        .edgesIgnoringSafeArea(.all)
                        .blur(radius: data.healthShown ? 3 : 0))
        .statusBar(hidden: height >= 812 ? false : true)
           .onAppear(perform: {

                if data.hours > 24 {
                    UserDefaults.standard.set(false, forKey: "firstDay")
                    data.firstDay = false
                }
                else if (abs(savedHours - now)) > 3600 {
                    data.hours += Int((abs(savedHours - now)) / 3600)
                    savedHours = Date()
                }

                if (abs(saved - now)) > 86400 {
                    data.score += Int((abs(saved - now)) / 86400)
                    saved = Date()
                }
            })
        
    }
}

struct healthNow: View {
    
    var text: String
    var picture: Image
    var description: String
    
    @State var offset: CGFloat = 0
    
    @EnvironmentObject var data: UserData
    
    var body: some View {
        
        VStack(spacing: 0){
        
            VStack{
                
                ZStack{
                    
                    RoundedRectangle(cornerRadius: 15)
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.white, Color(red: 1, green: 1, blue: 1, opacity: 0.50)]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 317, height: 88)
                        .opacity(0.4)
                    
                    picture
                        .resizable()
                        .frame(width: 90, height: 90)
                        .offset(x: -110)
                    
                    Text(text)
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 80, alignment: .leading)
                        .offset(x: 48)
                    
                }
                
                ZStack{
                
                VStack(spacing: 0){
                    
                RoundedCorners(tl: 15, tr: 15, bl: 0, br: 0)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.white, Color(red: 1, green: 1, blue: 1, opacity: 0.50)]), startPoint: .top, endPoint: .bottom))
                    .frame(width: 317, height: 37)
                    .opacity(0.4)
                
                RoundedCorners(tl: 0, tr: 0, bl: 15, br: 15)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.white, Color(red: 1, green: 1, blue: 1, opacity: 0.50)]), startPoint: .bottom, endPoint: .top))
                    .frame(width: 317, height: 51)
                    .opacity(offset != 0 ? 0.4 : 0)
                    
                }
                    
                    Text(description)
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(Color.white)
                        .frame(width: 300, height: 80, alignment: .topLeading)
                        .offset(y: 4)
                        .opacity(offset != 0 ? 1 : 0)
                    
                }
                
            }.offset(y: offset)
                .onTapGesture(perform: {
                    
                    data.healthShown.toggle()
                    
                    if offset == 0{
                        withAnimation(.linear(duration: 0.3)){
                            self.offset -= 59
                        }
                    }
                    
                    else{
                        withAnimation(.linear(duration: 0.3)){
                            self.offset = 0
                        }
                    }
                    
                })
            
        }.offset(y: UIScreen.screenHeight * 0.36) // padding from tabBar
        
    }
}

// RoundedCorners function
struct RoundedCorners: Shape {
    var tl: CGFloat = 0.0
    var tr: CGFloat = 0.0
    var bl: CGFloat = 0.0
    var br: CGFloat = 0.0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let w = rect.size.width
        let h = rect.size.height
        
        // Make sure we do not exceed the size of the rectangle
        let tr = min(min(self.tr, h/2), w/2)
        let tl = min(min(self.tl, h/2), w/2)
        let bl = min(min(self.bl, h/2), w/2)
        let br = min(min(self.br, h/2), w/2)
        
        path.move(to: CGPoint(x: w / 2.0, y: 0))
        path.addLine(to: CGPoint(x: w - tr, y: 0))
        path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr,
                    startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
        
        path.addLine(to: CGPoint(x: w, y: h - br))
        path.addArc(center: CGPoint(x: w - br, y: h - br), radius: br,
                    startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
        
        path.addLine(to: CGPoint(x: bl, y: h))
        path.addArc(center: CGPoint(x: bl, y: h - bl), radius: bl,
                    startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
        
        path.addLine(to: CGPoint(x: 0, y: tl))
        path.addArc(center: CGPoint(x: tl, y: tl), radius: tl,
                    startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
        path.closeSubpath()
        
        return path
    }
}

// Calculating the difference between dates
extension Date {
    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        mainView()
            .environmentObject(UserData())
    }
}


/*

 // healthNow list

1 час:
Нормализуется частота сердечных сокращений, начинает снижаться артериальное давление и улучшаться кровообращение (heart_1)
(Волокна в бронхах, которые ранее плохо функционировали из-за постоянного воздействия дыма, снова начнут двигаться. Эти волокна помогают выводить раздражители и бактерии из легких, снижая риск заражения)


12 часов:
Нормализуется уровень углекислого газа в крови, улучшается снабжение тканей кислородом. (co2)
(Организм избавляется от избытка CO2. Повышенное содержание кислорода помогает питать ткани и кровеносные сосуды, которые получали меньше кислорода во время курения.)


1 день:
Снижается риск развития инфаркта (heart_3)
(Это связано с нормализацией артериального давления и улучшением кислородного обмена. Вам становится легче выполнять упражнения и переносить физическую нагрузку)


2 день:
Вкусы и запахи становятся ярче (pie / pizza)
(В этот период восстанавливаются поврежденные дымом нервные окончания)


3 день:
Дышать становится легче (wings)
(Бронхи внутри легких начали расслабляться и открываться больше. Это облегчает обмен воздуха между углекислым газом и кислородом. Кроме того, способность легких наполняться воздухом возрастает)


4 день:
Запасы никотина в организме истощаются (nicotine)
(Вы можете стать более раздражительным, может возникать головная боль, но это все — признаки восстановления организма)


6 день:
Улучшается кровообращение и работа легких (lungs)

 
7 день:
Зависимость ослабевает (handcuffs)
(Этап в одну неделю важен не только для вашего здоровья, но и для вашего успешного отказа от курения в долгосрочной перспективе. Курильщики, которые успешно выдерживают одну неделю без курения, в девять раз чаще успешно бросают курить)


14 день:
Повседневные физические нагрузки проходят легче (walking)
(Это происходит благодаря улучшению кровообращения и оксигенации, так как функционирование легких улучшается примерно на 30 процентов - университет Мичигана)


30 день:
Восстанавливается нормальное функционирование легких (lungs)
(Уменьшается кашель и одышка. Повышается физическая выносливость организма)

Повышается уровень энергии (battery / energy)
(Вы также можете заметить, что многие симптомы, связанные с курением, уменьшились, например, заложенность носовых пазух и одышка при физических нагрузках.)

Укрепление иммунитета (virus)
(Волокна в легких, которые помогают поддерживать здоровье легких, отрастают. Эти волокна помогают уменьшать избыточное накопление слизи и защищают от бактериальных инфекций.)


30-90 день:
Кислородный обмен продолжает улучшаться (medical report)


90 дней:
Увеличивается уровень фертильности (baby)
(Репродуктивная функция улучшается, снижается риск преждевременных родов.)


180 дней:
Повышается стрессоустойчивость (balance / yoga / meditation)
(Вы можете переносить стрессовые ситуации без потребности в курении)

Снижается уровень слизи и мокроты в легких (lungs)
(Дыхательные пути гораздо меньше воспаляются без постоянного воздействия и содержащихся в нем химических веществ.)
 
 */

