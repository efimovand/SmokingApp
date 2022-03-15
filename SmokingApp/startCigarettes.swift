//
//  startCigarettes.swift
//  SmokingApp
//
//  Created by Андрей Ефимов on 15.03.2022.
//

import SwiftUI
import Combine
import UIKit

// Closing keyboard
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct startCigarettes: View {
    
    @State private var dailyUse: Int = 0
    @State var pricePackString: String = ""
    @State var pricePack: Int = 0
    
    var body: some View {
        
        ZStack{
            
            // background
            VStack(spacing: 0){
                
                // topBackground
                RoundedCorners(tl: 15, tr: 15, bl: 0, br: 0)
                    .fill(Color(red: 0.89, green: 0.93, blue: 1, opacity: 0.40))
                    .frame(width: 309, height: 67)
                
                // bottomBackground
                RoundedCorners(tl: 0, tr: 0, bl: 15, br: 15)
                    .fill(Color(red: 1, green: 1, blue: 1, opacity: 0.40))
                    .frame(width: 309, height: 169)
                
            }
            
            // overlayStroke + dropShadow
            
            // tittle
            Text("Немного рассчетов...")
                .font(.system(size: 22, weight: .heavy))
                .foregroundColor(Color.white)
                .frame(width: 250, height: 26, alignment: .leading)
                .offset(x: -15, y: -90)
            
            VStack(spacing: 30){
                
                // dailyUse
                HStack(spacing: 0){
                    
                    Text("Сколько сигарет в день вы курите?")
                        .font(.system(size: 19, weight: .heavy))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                        .frame(width: 190, height: 48, alignment: .top)
                        .padding(.trailing, 30)
                    
                    Picker("dailyUse", selection: $dailyUse) {
                        ForEach(1..<31) {
                            Text("\($0)")
                        }
                    }.pickerStyle(.wheel)
                        .labelsHidden()
                        .frame(width: 55, height: 32)
                        .clipped()
                        .background((Color.white).opacity(0.7))
                        .cornerRadius(15)
                    
                }.padding(.top, 50)
                
                // pricePack
                HStack(spacing: 0){
                    
                    Text("Стоимость одной пачки:")
                        .font(.system(size: 19, weight: .heavy))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                        .frame(width: 190, height: 48, alignment: .leading)
                        .padding(.trailing, 30)
                    
                    TextField("", text: $pricePackString)
                                .keyboardType(.numberPad)
                                .onReceive(Just(pricePackString)) { newValue in
                                    let filtered = newValue.filter { "0123456789".contains($0) }
                                    if filtered != newValue {
                                        self.pricePackString = filtered
                                    }
                            }
                                .labelsHidden()
                                .frame(width: 55, height: 32)
                                .clipped()
                                .background((Color.white).opacity(0.5))
                                .cornerRadius(15)
                                .multilineTextAlignment(.center)
                                
                }
                
            }
            
            
            // Hide keyboard invisible button
            Button(action: {hideKeyboard()}){
                Rectangle()
                    .frame(width: 375, height: 812)
                    .opacity(0)
            }
            
            HStack(spacing: 0){
                Text("dailyUse = ")
                Text(String(dailyUse + 1))
            }.offset(y: 200)
            
            HStack(spacing: 0){
                Text("pricePack = ")
                Text("\(pricePackString)")
            }.offset(y: 240)
            
        }.background(Image("background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 375, height: 812, alignment: .center)
                        .edgesIgnoringSafeArea(.all))
        
    }
    
}

struct startCigarettes_Previews: PreviewProvider {
    static var previews: some View {
        startCigarettes()
    }
}
