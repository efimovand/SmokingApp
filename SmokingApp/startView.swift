//
//  startView.swift
//  SmokingApp
//
//  Created by Андрей Ефимов on 15.03.2022.
//

import SwiftUI

struct startView: View {
    
    private func getScale(proxy: GeometryProxy) -> CGFloat {
        var scale: CGFloat = 1
        
        let x = proxy.frame(in: .global).minX
        
        // точка maxScaling
        let diff = abs(x - 48)
        
        if diff < 100 {
            scale = 1 + (100 - diff) / 500
        }
        
        return scale
    }
    
    
    
    var body: some View {
        
        ZStack{
            
            Text("Что вы курите?")
                .font(.system(size: 36, weight: .bold))
                .foregroundColor(Color.white)
                .frame(width: 354, height: 40, alignment: .leading)
                .padding(.leading, 21)
                .offset(y: -300)
            
            ScrollView(.horizontal, showsIndicators: false){
                
                HStack(spacing: 28){
                    
                    ForEach(0..<3) { num in
                        GeometryReader { proxy in
                            
                            let scale = getScale(proxy: proxy)
                            
                            Image("vape")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 300)
                                .clipped()
                                .cornerRadius(15)
                                .scaleEffect(CGSize(width: scale, height: scale))
                                .onTapGesture {
                                    // go to next view
                                }
                            
                            
                        }.frame(width: 280, height: 480)

                    }.cornerRadius(15)
                    
                }.padding(.leading, 45)
                    .padding(.trailing, 45)
                
            }
            
            
            
        }.background(Image("background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 375, height: 812, alignment: .center)
                        .edgesIgnoringSafeArea(.all))
        
        
    }
}

struct startView_Previews: PreviewProvider {
    static var previews: some View {
        startView()
    }
}
