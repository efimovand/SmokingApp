//
//  ContentView.swift
//  SmokingApp
//
//  Created by Андрей Ефимов on 25.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var selected = 0
    
    @State var score = 8
    @State var textBottom = "дней"
    
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
            
            
            // Main
            Group {
                //textTop
                Text("Вы не курите уже")
                    .font(.system(size: 48, weight: .bold))
                    .foregroundColor(Color.white)
                    .frame(width: 354, height: 121, alignment: .topLeading)
                    .offset(x: 10, y: -227)
                
                //score
                Text("\(score)")
                    .font(score < 10 ? .system(size: 288, weight: .heavy) : .system(size: 230, weight: .heavy))
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .frame(width: 328, height: 328, alignment: .center)
                    .offset(y: -55)
                
                //textBottom
                Text("\(textBottom)")
                    .font(.system(size: 48, weight: .bold))
                    .foregroundColor(Color.white)
                    .frame(width: 127, height: 58)
                    .offset(x: 78, y: 95)
                
                //healthNow
                ZStack{
                    
                    RoundedRectangle(cornerRadius: 15)
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.white, Color(red: 1, green: 1, blue: 1, opacity: 0.50)]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 317, height: 88)
                        .offset(y: 218)
                        .opacity(0.4)
                    
                    Image("lungs")
                        .resizable()
                        .frame(width: 90, height: 90)
                        .offset(x: -110, y: 218)
                    
                    Text("Лёгкие освобождаются от остатков CO2")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 65, alignment: .topLeading)
                        .offset(x: 48, y: 218)
                    
                    RoundedCorners(tl: 15, tr: 15, bl: 0, br: 0).fill(LinearGradient(gradient: Gradient(colors: [Color.white, Color(red: 1, green: 1, blue: 1, opacity: 0.50)]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 317, height: 37)
                        .offset(y: 291)
                        .opacity(0.4)
                    
                }
                
            }
        }.background(Image("background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 375, height: 812, alignment: .center)
                        .edgesIgnoringSafeArea(.all))
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
