//
//  startView.swift
//  SmokingApp
//
//  Created by Андрей Ефимов on 15.03.2022.
//

import SwiftUI

struct startView: View {
    
    // Parallax scaling function
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
    
    // Start models
    @State var images: [Image] = [Image("cigarettes"), Image("sticks"), Image("vape")]
    
    // Next views
    @State var cigarettesShown = false
    @State var sticksShown = false
    @State var vapeShown = false
    
    @State var number: Int = 0
    
    var body: some View {
        
        ZStack{
            
            // Header
            Text("Что вы курите?")
                .font(.system(size: 36, weight: .bold))
                .foregroundColor(Color.white)
                .frame(width: 354, height: 40, alignment: .leading)
                .padding(.leading, 21)
                .offset(y: -300)
            
            // Start models' carousel
            ScrollView(.horizontal, showsIndicators: false){
                
                HStack(spacing: 28){
                    
                    ForEach(0..<3) { num in
                        
                        GeometryReader { proxy in
                            
                            let scale = getScale(proxy: proxy)
                        
                            images[num]
                                .resizable()
                                .scaledToFill()
                                .frame(width: 300)
                                .clipped()
                                .cornerRadius(15)
                                .scaleEffect(CGSize(width: scale, height: scale))
                                .onTapGesture {
                                    if num == 0 {
                                        cigarettesShown.toggle()
                                    }
                                    else if num == 1 {
                                        sticksShown.toggle()
                                    }
                                    else if num == 2 {
                                        vapeShown.toggle()
                                    }
                                }
                            
                        }.frame(width: 280, height: 480)
                        
                    }.cornerRadius(15)
                    
                }.padding(.leading, 45)
                    .padding(.trailing, 45)
                
            }
            
            
            // going to the next view
            if cigarettesShown {
                startCigarettes(cigarettesShown: $cigarettesShown)
            }
            
            if sticksShown {
                startSticks(sticksShown: $sticksShown)
            }
            
            if vapeShown {
                startVape(vapeShown: $vapeShown)
            }
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Image("background")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 375, height: .infinity, alignment: .center)
                            .edgesIgnoringSafeArea(.all))
    }
    
    
}


struct startView_Previews: PreviewProvider {
    static var previews: some View {
        startView()
    }
}
