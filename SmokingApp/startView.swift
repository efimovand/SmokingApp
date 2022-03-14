//
//  startView.swift
//  SmokingApp
//
//  Created by Андрей Ефимов on 15.03.2022.
//

import SwiftUI

struct startView: View {
    var body: some View {
        
        HStack{
            
            Text("Что вы курите?")
                .font(.system(size: 36, weight: .bold))
                .foregroundColor(Color.white)
                .frame(width: 354, height: 40, alignment: .leading)
                .padding(.leading, 21)
                .offset(y: -300)
            
            ScrollView(.horizontal, showsIndicators: false){
                
                
                
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
