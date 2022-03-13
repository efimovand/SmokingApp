//
//  ContentView.swift
//  SmokingApp
//
//  Created by Андрей Ефимов on 25.02.2022.
//

import SwiftUI

struct mainView: View {
    
    @State var selected = 0
    @State var score: Int = 8
    
    var body: some View {
        
        ZStack{
            
            // Main
            VStack{
                
                //textTop
                Text("Вы не курите уже")
                    .font(.system(size: 48, weight: .bold))
                    .foregroundColor(Color.white)
                    .frame(width: 354, height: 121, alignment: .topLeading)
                    .padding(.leading, 20)
                    .offset(y: 80)
                
                //score
                if (score < 10){
                    Text("\(score)")
                        .font(.system(size: 288, weight: .heavy))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .frame(width: 328, height: 328, alignment: .top)
                        .offset(y: 19)
                }
                else if (score > 10 && score < 100){
                    Text("\(score)")
                        .font(.system(size: 250, weight: .heavy))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .frame(width: 375, height: 328, alignment: .top)
                        .offset(y: 44)
                }
                else if (score >= 100){
                    Text("\(score)")
                        .font(.system(size: 170, weight: .heavy))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .frame(width: 375, height: 328, alignment: .top)
                        .offset(y: 80)
                }
                
                //textBottom
                if ((score != 11) && (score % 10 == 1)){
                    Text("день")
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(Color.white)
                        .frame(width: 127, height: 58)
                        .offset(x: 78, y: -32)
                }
                else if (((score != 12) && (score != 13) && (score != 14)) && ((score % 10 == 2) || (score % 10 == 3) || (score % 10 == 4))){
                    Text("дня")
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(Color.white)
                        .frame(width: 127, height: 58)
                        .offset(x: 78, y: -32)
                }
                else{
                    Text("дней")
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(Color.white)
                        .frame(width: 127, height: 58)
                        .offset(x: 78, y: -32)
                }
                
                Spacer()
            }
            
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
        mainView()
    }
}