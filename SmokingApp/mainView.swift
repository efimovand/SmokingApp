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
    @State var firstDay = UserDefaults.standard.bool(forKey: "firstDay")
    @State var savedHours = UserDefaults.standard.object(forKey: "savedHours") as! Date
    @State var saved = UserDefaults.standard.object(forKey: "savedTime") as! Date
    @State var now = Date()
    
    @State var height: Float = Float(UIScreen.screenHeight)
    @State var blurRadius : CGFloat = 0
    

    // List of healthNow
    @State var healthCase = [
        
        // default [0]
        healthNow(text: "Здесь будут отображаться сведения об изменениях в организме", picture: Image("heart_1"), description: "С каждым днем все будет только лучше"),
        
        // 1 hour [1]
        healthNow(text: "Нормализуется частота сердечных сокращений, начинает снижаться артериальное давление", picture: Image("heartrate"), description: "Волокна в бронхах, которые ранее плохо функционировали из-за постоянного воздействия дыма, снова начинают двигаться. Эти волокна помогают выводить раздражители и бактерии из легких, снижая риск заражения."),
        
        // 12 hours [2]
        healthNow(text: "Нормализуется уровень углекислого газа в крови, улучшается снабжение тканей кислородом", picture: Image("co2"), description: "Организм избавляется от избытка CO2. Повышенное содержание кислорода помогает питать ткани и кровеносные сосуды, которые получали меньше кислорода во время курения."),
        
        // 1 day [3]
        healthNow(text: "Снижается риск развития инфаркта", picture: Image("heart_3"), description: "Это связано с нормализацией артериального давления и улучшением кислородного обмена. Вам становится легче выполнять упражнения и переносить физическую нагрузку."),
        
        // 2 days [4]
        healthNow(text: "Вкусы и запахи становятся ярче", picture: Image("pie"), description: "В этот период восстанавливаются поврежденные дымом нервные окончания."),
        
        // 3 days [5]
        healthNow(text: "Дышать становится легче", picture: Image("wings"), description: "Бронхи внутри легких начали расслабляться и открываться больше. Это облегчает обмен воздуха между углекислым газом и кислородом. Кроме того, способность легких наполняться воздухом возрастает."),
        
        // 4 days [6]
        healthNow(text: "Запасы никотина в организме истощаются", picture: Image("nicotine"), description: "Вы можете стать более раздражительным, может возникать головная боль, но это все — признаки восстановления организма."),
        
        // 5 days [7]
        healthNow(text: "Восстанавливаются защитные механизмы", picture: Image("virus"), description: "Увеличивается уровень таких защитных антиоксидантов в крови, как витамин С и E. Это помогает организму бороться с возможными заболеваниями."),
        
        // 6 days [8]
        healthNow(text: "Улучшается кровообращение и работа легких", picture: Image("medicalreport"), description: "Организм начинает улучшать кровообращение и комплексно восстанавливать легкие. Изменение кровообращения положительно влияет на все системы организма."),
        
        // 7 days [9]
        healthNow(text: "Зависимость ослабевает", picture: Image("handcuffs"), description: "Этап в одну неделю важен не только для вашего здоровья, но и для успешного отказа от курения в долгосрочной перспективе. Курильщики, которые успешно выдерживают одну неделю без курения, в девять раз чаще успешно бросают курить."),
        
        // 8...9 days [10]
        healthNow(text: "Увеличивается оборот клеток кожи", picture: Image("moleculas"), description: "По мере увеличения оборота клеток ваша кожа начинает восстанавливаться. Это происходит потому, что теперь к вашей коже притекает гораздо больше крови. Увеличение оборота клеток кожи помогает уменьшить появление морщин и улучшает способность вашей кожи заживлять шрамы от акне."),
        
        // 10...11 days [11]
        healthNow(text: "Облегчается синдром сухого глаза", picture: Image("eye"), description: "Курение удваивает риск развития синдрома сухого глаза — распространенного заболевания, вызванного недостаточной влажностью поверхности глаз. Дым содержит токсины, которые раздражают глаза, что может вызвать и усугубить этот синдром, особенно если вы носите контактные линзы."),
        
        // ???
        
        // 14...15 days [12]
        healthNow(text: "Повседневные физические нагрузки проходят легче", picture: Image("walking_2"), description: "Это происходит благодаря улучшению кровообращения и оксигенации, так как функционирование легких улучшается примерно на 30 процентов."),
        
        // 16...17 days [13]
        healthNow(text: "Улучшается цвет кожи", picture: Image("beauty_2"), description: "Увеличение кровотока делает ваш цвет лица менее серым и бледным, что является одним из наиболее заметных различий в вашей коже до и после отказа от курения. По мере того, как ваша кожа получает больше питательных веществ и кислорода, ваше лицо может приобретать здоровый блеск."),
        
        // 18...19 days [14]
        healthNow(text: "Снижается уровень тревоги", picture: Image("meditation_1"), description: "Никотин играет большую роль в развитии беспокойства. Также некоторые исследования утверждают, что курильщики более склонны к развитию депрессии, чем некурящие люди. В данный период отмены возможный уровень тревоги спадает, а симптомы абстиненции облегчаются."),
        
        // 20...21 days [15]
        healthNow(text: "Восстанавливается сон", picture: Image("sleep"), description: "Нарушения сна, вызванные синдромом отмены, постепенно начинают проходить. Нервная система восстанавливается, улучшая сон и помогая организму в борьбе с возможной бессонницей."),
        
        // ???
        
        // 30...32 days [16]
        healthNow(text: "Восстанавливается нормальное функционирование легких", picture: Image("lungs"), description: "Уменьшается кашель и одышка. Повышается физическая выносливость организма."),
        
        // 33...35 days [17]
        healthNow(text: "Повышается уровень энергии", picture: Image("battery"), description: "Вы также можете заметить, что многие симптомы, связанные с курением, уменьшились. Например, заложенность носовых пазух и одышка при физических нагрузках."),
        
        // 36...39 days [18]
        healthNow(text: "Укрепление иммунитета", picture: Image("shield"), description: "Волокна в легких, которые помогают поддерживать здоровье легких, отрастают. Эти волокна помогают уменьшать избыточное накопление слизи и защищают от бактериальных инфекций."),
        
        // 40...42 days [19]
        healthNow(text: "Улучшается общее качество сна", picture: Image("bed"), description: "Курение снижает глубину медленных фаз, которые помогают организму эффективно восполнять силы. После восстановления возможных нарушений сна, связанных с синдромом отмены, организм улучшает общее качество сна. Кроме того, уменьшаются проблемы с долгим засыпанием и апноэ."),
        
        // 43...45 days [20]
        healthNow(text: "Кислородный обмен продолжает улучшаться", picture: Image("dizzyhead"), description: "Этот процесс помогает избавиться от общего недомогания, слабости, ухудшенной умственной деятельности, апатии и головокружения."),
        
        // 46...48 days [21]
        healthNow(text: "Восстанавливается кожа", picture: Image("beauty"), description: "Курение снижает выработку организмом коллагена и эластина, двух белков, которые сохраняют упругость и эластичность кожи. Теперь ваша кожа начинает улучшаться, поскольку коллаген и эластин обновляются в этот период."),
        
        // 49...51 days [22] (NEW 9)
        healthNow(text: "Восстанавливаются десны", picture: Image("teeth"), description: "Курение снижает количество кислорода, переносимого кровью, что затрудняет борьбу организма с возможными воспалениями десен. Кроме того, тепло от курения вызывает повреждение десен и горла, воспаляя их. Теперь десны комплексно восстанавливаются, избавляясь от возможных заболеваний, связанных с курением."),
        
        // 52...54 days [23]
        healthNow(text: "Снижается риск глазных заболеваний", picture: Image("eyecare"), description: "Курение увеличивает количество свободных радикалов в глазах. Свободные радикалы несут ответственность за повреждение липидов и белков и вызывают образование отложений на поверхности хрусталика глаза, что приводит к развитию катаракты. В этот период отказа антиоксиданты, потребляемые с пищей, успешно борются с оставшимися свободными радикалами, значительно снижая риск возникновения катаракты."),
        
        // 90 days [24]
        healthNow(text: "Увеличивается уровень фертильности", picture: Image("baby"), description: "Репродуктивная функция улучшается, снижается риск преждевременных родов."),
        
        // 180 days [25]
        healthNow(text: "Повышается стрессоустойчивость", picture: Image("yoga"), description: "Вы можете переносить стрессовые ситуации без потребности в курении."),
        
        // 180 days [26]
        healthNow(text: "Снижается уровень слизи и мокроты в легких", picture: Image("lungs"), description: "Дыхательные пути гораздо меньше воспаляются без постоянного воздействия и содержащихся в нем химических веществ."),
        
        // 180 days [27]
        healthNow(text: "Улучшается выработка глюкозы", picture: Image("honey"), description: "Благодаря снижению уровня никотина и окиси углерода в организме  улучшается выработка глюкозы. Это также позволяет организму более эффективно контролировать уровень сахара в крови у диабетиков."),
        
        
    ]
    
    var body: some View {
        
        ZStack{
            
            
            // Main
            VStack(spacing: 0){
                
                if firstDay && data.firstDay {
                    
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
            .blur(radius: blurRadius)
            .onChange(of: data.healthShown, perform: { value in
                switch value {
                case false : withAnimation { blurRadius = 0 }
                case true: withAnimation { blurRadius = 3 }
                }
            })
            
            
            
            Spacer(minLength: UIScreen.screenHeight * 0.09)
            
            
            // healthNow
            ZStack{
                
                switch data.score{
                    
                case 0:
                    if data.hours < 12 {
                        healthCase[1]
                    }
                    else {
                        healthCase[2]
                    }
                case 1:
                    healthCase[3]
                case 2:
                    healthCase[4]
                case 3:
                    healthCase[5]
                case 4:
                    healthCase[6]
                case 5:
                    healthCase[7]
                case 6:
                    healthCase[8]
                case 7:
                    healthCase[9]
                case 8...9:
                    healthCase[10]
                case 10...11:
                    healthCase[11]
                case 14...15:
                    healthCase[12]
                case 16...17:
                    healthCase[13]
                case 18...19:
                    healthCase[14]
                case 19...20:
                    healthCase[15]
                case 30...32:
                    healthCase[16]
                case 33...35:
                    healthCase[17]
                case 36...39:
                    healthCase[18]
                case 40...42:
                    healthCase[19]
                case 43...45:
                    healthCase[20]
                case 46...48:
                    healthCase[21]
                case 49...51:
                    healthCase[22]
                case 52...54:
                    healthCase[23]
                case 90:
                    healthCase[24]
                case 180:
                    healthCase[25] // 25 or 26 or 27
                default:
                    healthCase[0]
                    
                }
                
            }.frame(height: 666, alignment: .center)
                .clipped()
            
            
            // statsNow
            ZStack{
                
                //statsNow()
            
            }.frame(width: UIScreen.screenWidth, alignment: .trailing)
            
            
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

               if data.hours >= data.maxScoreHours {
                   data.maxScoreHours = data.hours
               }

            })
        
    }
    
}


// healthNow struct
struct healthNow: View {
    
    var text: String
    var picture: Image
    var description: String
    var quit: Bool = true
    
    @State var size: CGFloat = (UIScreen.screenHeight >= 812 ? UIScreen.screenHeight * 0.374 : UIScreen.screenHeight * 0.37745)
    @State var descriptionTextOpacity: CGFloat = 0
    @State var height: Float = Float(UIScreen.screenHeight)
    
    @EnvironmentObject var data: UserData
    
    var body: some View {
        
        ZStack{
        
        VStack(spacing: 0){
        
            VStack{
                
                // healthNow
                ZStack{
                    
                    RoundedRectangle(cornerRadius: 15)
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.white, Color(red: 1, green: 1, blue: 1, opacity: 0.50)]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 317, height: 88)
                        .opacity(0.4)
                    
                    picture
                        .resizable()
                        .frame(width: 90, height: 90)
                        .offset(x: -110)
                    
                    switch text.count {
                        
                    case 1...10: Text(text)
                            .font(.system(size: 35, weight: .bold))
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 80, alignment: .leading)
                            .offset(x: 40)
                        
                    case 11...23:
                        if (text != "Восстанавливается сон" && text != "Восстанавливается кожа" && text != "Восстанавливаются десны") {
                            Text(text)
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 80, alignment: .leading)
                            .offset(x: 40)
                        }
                        if (text != "Восстанавливаются десны") {
                            Text(text)
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(Color.white)
                            .frame(width: 215, height: 80, alignment: .leading)
                            .offset(x: 40)
                        }
                        else {
                            Text(text)
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(Color.white)
                            .frame(width: 217, height: 80, alignment: .leading)
                            .offset(x: 37)
                        }
                        
                    case 24...33: Text(text)
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 80, alignment: .leading)
                            .offset(x: 40)
                        
                    case 34...42: Text(text)
                            .font(.system(size: 19, weight: .bold))
                            .foregroundColor(Color.white)
                            .frame(width: 205, height: 80, alignment: .leading)
                            .offset(x: 40)
                        
                    case 43...48: Text(text)
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 80, alignment: .leading)
                            .offset(x: 40)
                        
                    case 49...55: Text(text)
                            .font(.system(size: 15.5, weight: .bold))
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 80, alignment: .leading)
                            .offset(x: 40)
                        
                    case 80...119: Text(text)
                            .font(.system(size: 14.5, weight: .bold))
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 80, alignment: .leading)
                            .offset(x: 40)
                        
                    case 100...120: Text(text)
                            .font(.system(size: 12.5, weight: .bold))
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 80, alignment: .leading)
                            .offset(x: 40)
                        
                    default: Text(text)
                            .font(.system(size: 15, weight: .bold))
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 80, alignment: .leading)
                            .offset(x: 40)
                        
                    }

                }
                
                // description
                ZStack{
                    
                    VStack(spacing: 0){
                        
                        RoundedRectangle(cornerRadius: 15)
                            .fill(LinearGradient(gradient: Gradient(colors: [Color.white, Color(red: 1, green: 1, blue: 1, opacity: 0.50)]), startPoint: .top, endPoint: .bottom))
                            .frame(width: 317, height: 110)
                            .opacity(0.4)
                        
                    }
                    
                    switch description.count {
                        
                    case 65...75: Text(description)
                            .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                        .frame(width: 295, height: 100, alignment: .topLeading)
                        .offset(x: 3, y: 2)
                        .opacity(descriptionTextOpacity)
                        .onChange(of: data.healthShown, perform: { value in
                            switch value {
                            case false : withAnimation(.linear(duration: 0.35)) { descriptionTextOpacity = 0 }
                            case true: withAnimation(.easeInOut(duration: 0.9)) { descriptionTextOpacity = 1 }
                            }
                        })
                        
                    case 110...120: Text(description)
                            .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                        .frame(width: 295, height: 100, alignment: .top)
                        .offset(y: 2)
                        .opacity(descriptionTextOpacity)
                        .onChange(of: data.healthShown, perform: { value in
                            switch value {
                            case false : withAnimation(.linear(duration: 0.35)) { descriptionTextOpacity = 0 }
                            case true: withAnimation(.easeInOut(duration: 0.9)) { descriptionTextOpacity = 1 }
                            }
                        })
                        
                    case 150...165: Text(description)
                            .font(.system(size: 14.8, weight: .semibold))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                        .frame(width: 295, height: 100, alignment: .center)
                        .offset(y: -3)
                        .opacity(descriptionTextOpacity)
                        .onChange(of: data.healthShown, perform: { value in
                            switch value {
                            case false : withAnimation(.linear(duration: 0.35)) { descriptionTextOpacity = 0 }
                            case true: withAnimation(.easeInOut(duration: 0.9)) { descriptionTextOpacity = 1 }
                            }
                        })
                        
                    case 166...189: Text(description)
                            .font(.system(size: 13.9, weight: .semibold))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                        .frame(width: 295, height: 100, alignment: .center)
                        .opacity(descriptionTextOpacity)
                        .onChange(of: data.healthShown, perform: { value in
                            switch value {
                            case false : withAnimation(.linear(duration: 0.35)) { descriptionTextOpacity = 0 }
                            case true: withAnimation(.easeInOut(duration: 0.9)) { descriptionTextOpacity = 1 }
                            }
                        })
                        
                    case 190...205: Text(description)
                            .font(.system(size: 13.5, weight: .semibold))
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.leading)
                            .frame(width: 295, height: 100, alignment: .top)
                            .opacity(descriptionTextOpacity)
                            .onChange(of: data.healthShown, perform: { value in
                                switch value {
                                case false : withAnimation(.linear(duration: 0.35)) { descriptionTextOpacity = 0 }
                                case true: withAnimation(.easeInOut(duration: 0.9)) { descriptionTextOpacity = 1 }
                                }
                            })
                        
                    case 206...230: Text(description)
                            .font(.system(size: 12.8, weight: .semibold))
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.leading)
                            .frame(width: 295, height: 100, alignment: .top)
                            .offset(y: 2)
                            .opacity(descriptionTextOpacity)
                            .onChange(of: data.healthShown, perform: { value in
                                switch value {
                                case false : withAnimation(.linear(duration: 0.35)) { descriptionTextOpacity = 0 }
                                case true: withAnimation(.easeInOut(duration: 0.9)) { descriptionTextOpacity = 1 }
                                }
                            })
                        
                    case 231...280:
                        
                        ScrollView([.vertical], showsIndicators: false) {
                        
                        Text(description)
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.leading)
                            .frame(width: 295, height: 120, alignment: .top)
                            .opacity(descriptionTextOpacity)
                            .onChange(of: data.healthShown, perform: { value in
                                switch value {
                                case false : withAnimation(.linear(duration: 0.35)) { descriptionTextOpacity = 0 }
                                case true: withAnimation(.easeInOut(duration: 0.9)) { descriptionTextOpacity = 1 }
                                }
                            })
                            
                        }.frame(width: 295, height: 100)
                        
                    case 281...305:
                        
                        ScrollView([.vertical], showsIndicators: false) {
                        
                        Text(description)
                            .font(.system(size: 12.8, weight: .semibold))
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.leading)
                            .frame(width: 295, height: 140, alignment: .top)
                            .offset(y: 1)
                            .opacity(descriptionTextOpacity)
                            .onChange(of: data.healthShown, perform: { value in
                                switch value {
                                case false : withAnimation(.linear(duration: 0.35)) { descriptionTextOpacity = 0 }
                                case true: withAnimation(.easeInOut(duration: 0.9)) { descriptionTextOpacity = 1 }
                                }
                            })
                        
                    }.frame(width: 295, height: 100)
                        
                    case 306...395:
                            
                        ScrollView([.vertical], showsIndicators: false) {
                            
                        Text(description)
                            .font(.system(size: 12.5, weight: .semibold))
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.leading)
                            .frame(width: 295, height: 170, alignment: .top)
                            .offset(y: 2)
                            .opacity(descriptionTextOpacity)
                            .onChange(of: data.healthShown, perform: { value in
                                switch value {
                                case false : withAnimation(.linear(duration: 0.35)) { descriptionTextOpacity = 0 }
                                case true: withAnimation(.easeInOut(duration: 0.9)) { descriptionTextOpacity = 1 }
                                }
                            })
                            
                        }.frame(width: 295, height: 100)
                        
                    default: Text(description)
                            .font(.system(size: 14.5, weight: .semibold))
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.leading)
                            .frame(width: 295, height: 100, alignment: .top)
                            .opacity(descriptionTextOpacity)
                            .onChange(of: data.healthShown, perform: { value in
                                switch value {
                                case false : withAnimation(.linear(duration: 0.35)) { descriptionTextOpacity = 0 }
                                case true: withAnimation(.easeInOut(duration: 0.9)) { descriptionTextOpacity = 1 }
                                }
                            })
                        
                    }
                    
                }
                
            }
            
        }.offset(y: size)
            .onTapGesture(perform: {
                
                if height >= 812 {
                    
                data.healthShown ? (self.size = UIScreen.screenHeight * 0.374) : (self.size = UIScreen.screenHeight * 0.374 / 1.4)
                data.healthShown.toggle()
                    
                }
                
                else {
                    
                    data.healthShown ? (self.size = UIScreen.screenHeight * 0.37745) : (self.size = UIScreen.screenHeight * 0.37745 / 1.5)
                    data.healthShown.toggle()
                    
                }
                
            })
            .gesture(DragGesture()
                           .onChanged({ (value) in
                               
                               if height >= 812 {
                               
                               if value.translation.height > 0{
                                   data.healthShown = false
                                   let temp = UIScreen.screenHeight * 0.374 / 1.4
                                   self.size = temp + value.translation.height
                               }
                               else{
                                   data.healthShown = true
                                   let temp = UIScreen.screenHeight * 0.374
                                   self.size = temp + value.translation.height
                               }
                                   
                               }
                               
                               else {
                                   
                                   if value.translation.height > 0{
                                       data.healthShown = false
                                       let temp = UIScreen.screenHeight * 0.37745 / 1.5
                                       self.size = temp + value.translation.height
                                   }
                                   else{
                                       data.healthShown = true
                                       let temp = UIScreen.screenHeight * 0.37745
                                       self.size = temp + value.translation.height
                                   }
                                   
                               }
                               
                           })
                           .onEnded({ (value) in
                               
                               if height >= 812 {
                               
                               if value.translation.height > 0{
                                
                                   if value.translation.height < -5{
                                       self.size = UIScreen.screenHeight * 0.374 / 1.4
                                   }
                                   else{
                                       self.size = UIScreen.screenHeight * 0.374
                                   }
                               }
                               else{
                                   
                                   if value.translation.height > 5{
                                       self.size = UIScreen.screenHeight * 0.374
                                   }
                                   else{
                                       self.size = UIScreen.screenHeight * 0.374 / 1.4
                                   }
                               }
                                   
                               }
                               
                               else {
                                   
                                   if value.translation.height > 0{
                                    
                                       if value.translation.height < -5{
                                           self.size = UIScreen.screenHeight * 0.37745 / 1.5
                                       }
                                       else{
                                           self.size = UIScreen.screenHeight * 0.37745
                                       }
                                   }
                                   else{
                                       
                                       if value.translation.height > 5{
                                           self.size = UIScreen.screenHeight * 0.37745
                                       }
                                       else{
                                           self.size = UIScreen.screenHeight * 0.37745 / 1.5
                                       }
                                   }
                                   
                               }
                               
                           })).animation(.spring(), value: size)
            
            if quit {
                
            // invisible quit button
            if (size != UIScreen.screenHeight * 0.374 && size != UIScreen.screenHeight * 0.37745) {
                
                Button(action: {
                        
                        if height >= 812 {
                            
                        self.size = UIScreen.screenHeight * 0.374
                        data.healthShown = false
                            
                        }
                        
                        else {
                            
                            self.size = UIScreen.screenHeight * 0.37745
                            data.healthShown = false
                            
                        }
                    
                }) {
                
                Rectangle()
                    .fill(Color.white)
                    .frame(width: .infinity, height: 455)
                    .offset(y: UIScreen.screenHeight >= 812 ? -UIScreen.screenHeight * 0.145 : -UIScreen.screenHeight * 0.25)
                    .opacity(0)
                    
                }
                
            }
            
        }
            
        }
        
    }
}


// statsNow struct
struct statsNow: View {
    
    @EnvironmentObject var data: UserData
    
    @State var nonSmoked: Int = 1
    @State var resin: Int = 125
    @State var size: CGFloat = UIScreen.screenWidth / 1.8
    
    var body: some View {
        
        HStack(spacing: 0){
            
            // Open Button
            ZStack {
                
                RoundedCorners(tl: 20, tr: 0, bl: 20, br: 0)
                    .fill(Color.white)
                    .opacity(0.4)
                    .overlay(Image(systemName: "triangle.fill")
                        .resizable()
                        .frame(width: 26, height: 21)
                        .foregroundColor(Color.white)
                        .opacity(0.6)
                        .rotationEffect(.degrees(-90)))
                    .frame(width: 30, height: 120)
                    .offset(y: -100)
                
            }.onTapGesture(perform: {
                
                if size == 0{
                    self.size += UIScreen.screenWidth / 1.8
                }
                else {
                    self.size -= UIScreen.screenWidth / 1.8
                }
                
            })
            
            // Stats
            ZStack {
                
                // background
                Rectangle()
                    .fill(Color("a39cf4"))
                    .frame(width: UIScreen.screenWidth / 1.8, height: UIScreen.screenHeight)
                
                VStack{
                    
                    // non smoked cigarettes
                    ZStack{
                        
                        // background
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.white)
                            .opacity(0.25)
                            .frame(width: 195, height: 60)
                        
                        HStack(spacing: 2) {
                            
                            Image("yoga")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color.white).opacity(0.2))
                            
                            Text("Вы не выкурили \(nonSmoked) сигарет")
                                .font(.system(size: 14.5, weight: .semibold))
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color.white)
                                .frame(width: 130, height: 50)
                            
                        }
                        
                    }
                    
                    // non got resin
                    ZStack{
                        
                        // background
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.white)
                            .opacity(0.25)
                            .frame(width: 195, height: 60)
                        
                        HStack(spacing: 2) {
                            
                            Image("balance")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color.white).opacity(0.2))
                            
                            Text("\(resin)мг смолы не попало вам в легкие")
                                .font(.system(size: 12, weight: .semibold))
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color.white)
                                .frame(width: 130, height: 50)
                            
                        }
                        
                    }
                    
                    // completed achievements
                    ZStack{
                        
                        // background
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.white)
                            .opacity(0.25)
                            .frame(width: 195, height: 60)
                        
                        HStack(spacing: 2) {
                            
                            Image("win")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color.white).opacity(0.2))
                            
                            VStack{
                                
                            Text("Достижений выполнено")
                                .font(.system(size: 10, weight: .semibold))
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color.white)
                                .frame(width: 130)
                                
                                // progressBar
                                
                            }
                            
                        }
                        
                    }
                    
                }
                
            }.frame(width: UIScreen.screenWidth / 1.8, height: UIScreen.screenHeight)
            
        }.offset(x: size)
        
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
        
//        statsNow()
//            .environmentObject(UserData())
//            .background(Image("background")
//                .resizable()
//                .frame(width: 830, height: 830))
        
    }
}


