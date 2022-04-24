//
//  newGoalView.swift
//  SmokingApp
//
//  Created by Андрей Ефимов on 23.03.2022.
//

import SwiftUI

struct newGoalView: View {
    
    @EnvironmentObject var data: UserData
    
    @Binding var goalShown: Bool
    
    @State var name = ""
    @State var value = ""
    
    @State var picturesShown: Bool = false
    @State var pictureTapped: Bool = false
    
    @State var pickerShown: Bool = false
    @State var userImage = UIImage(named: "image")!
    
    var body: some View {
        
        ZStack{
            
            // Hide keyboard invisible button
            if (name != "") && (value != "") {
                Button(action: {hideKeyboard()}){
                    Rectangle()
                        .frame(width: .infinity, height: .infinity)
                        .opacity(0)
                }
            }
            
            VStack(spacing: 0){
                
                ZStack{
                    
                    VStack(spacing: 0){
                        
                        // background
                        RoundedCorners(tl: 15, tr: 15, bl: 0, br: 0)
                            .fill(Color(red: 1, green: 1, blue: 1, opacity: 0.65))
                            .frame(width: 295, height: 30)
                        
                        RoundedCorners(tl: 0, tr: 0, bl: 15, br: 15)
                            .fill(Color(red: 1, green: 1, blue: 1, opacity: 0.50))
                            .frame(width: 295, height: 110)
                        
                    }.overlay(RoundedRectangle(cornerRadius: 15).stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.60), Color(red: 1, green: 1, blue: 1, opacity: 0.30)]), startPoint: .topTrailing, endPoint: .bottomLeading), lineWidth: 1).frame(width: 295, height: 140))
                    
                    // Title
                    Text("Новая цель")
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundColor(Color.white)
                        .padding(.bottom, 110)
                    
                    HStack(spacing: 12){
                        
                        // picture
                        Button(action: {
                            picturesShown.toggle()
                            pictureTapped = true
                        }) {
                            
                            if userImage == UIImage(named: "image"){
                                
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor((Color.white).opacity(0.4))
                                .frame(width: 80, height: 80)
                                .overlay(Text("Фото").font(.system(size: 13, weight: .semibold)).foregroundColor(Color.white).opacity(pictureTapped ? 0 : 1))
                                .overlay(Image(data.goalPicture ?? "")
                                    .resizable()
                                    .frame(width: 80, height: 80))
                                
                            }
                            
                            else {
                                
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor((Color.white).opacity(0.4))
                                    .frame(width: 80, height: 80)
                                    .overlay(Text("Фото").font(.system(size: 13, weight: .semibold)).foregroundColor(Color.white).opacity(pictureTapped ? 0 : 1))
                                    .overlay(Image(uiImage: userImage)
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                        .cornerRadius(15))
                                
                            }
                            
                        }
                        
                        // Text Form
                        VStack(spacing: 5){
                            
                            // name
                            VStack(spacing: 0){
                                
                                Text("Название")
                                    .font(.system(size: 13, weight: .semibold))
                                    .foregroundColor(Color.white)
                                    .frame(width: 170, alignment: .center)
                                
                                TextField("", text: $name)
                                    .font(.system(size: 18, weight: .heavy))
                                    .foregroundColor(Color.white)
                                    .labelsHidden()
                                    .background((Color.white).opacity(0.3))
                                    .frame(width: 180, height: 25)
                                    .clipped()
                                    .cornerRadius(50)
                                    .multilineTextAlignment(.center)
                                
                            }
                            
                            // value
                            VStack(spacing: 0){
                                
                                Text("Стоимость")
                                    .font(.system(size: 11, weight: .semibold))
                                    .foregroundColor(Color.white)
                                    .frame(width: 170, alignment: .center)
                                
                                TextField("", text: $value)
                                    .keyboardType(.numberPad)
                                    .font(.system(size: 18, weight: .heavy))
                                    .foregroundColor(Color.white)
                                    .labelsHidden()
                                    .background((Color.white).opacity(0.3))
                                    .frame(width: 140, height: 25)
                                    .clipped()
                                    .cornerRadius(30)
                                    .multilineTextAlignment(.center)
                                
                            }
                            
                        }.padding(.bottom, 3)
                        
                    }.padding(.top, 30)
                    
                    // Quit Button
                    Button(action: {
                        goalShown.toggle()
                        data.goalPicture = ""
                        data.goalName = ""
                        data.goalValue = 0
                    }) {
                        
                        
                        Circle()
                            .fill(Color(red: 1, green: 1, blue: 1).opacity(0.3))
                            .frame(width: 21, height: 21)
                            .overlay(Image(systemName: "multiply")
                                .foregroundColor(Color.white)
                                .font(.system(size: 14)))
                            .overlay(Circle().stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.80), Color(red: 1, green: 1, blue: 1, opacity: 0.50)]), startPoint: .topTrailing, endPoint: .bottomLeading), lineWidth: 0.3))
                        
                    }.offset(x: 128, y: -55)
                    
                }
                
                // Accept Button
                if (name != "") && (value != "") {
                    
                    Button(action: {
                        
                        if userImage != UIImage(named: "image") {
                            data.userImageBool = true
                            UserDefaults.standard.set(true, forKey: "userImageBool")
                            data.userImage = Image(uiImage: userImage)
                            let savedUserImage = saveImage(image: userImage)
                        }
                        else{
                            data.userImageBool = false
                            UserDefaults.standard.set(false, forKey: "userImageBool")
                        }
                        
                        data.goalName = name
                        data.goalValue = Int(value) ?? 0
                        data.isGoal = true
                        UserDefaults.standard.set(name, forKey: "goalName")
                        UserDefaults.standard.set(Int(value) ?? 0, forKey: "goalValue")
                        UserDefaults.standard.set(0, forKey: "freeMoney")
                        UserDefaults.standard.set(true, forKey: "isGoal")
                        goalShown.toggle()

                    }) {
                        
                        ZStack{
                            
                            RoundedCorners(tl: 0, tr: 0, bl: 15, br: 15)
                                .fill(Color(red: 1, green: 1, blue: 1, opacity: 0.70))
                                .frame(width: 150, height: 25)
                            
                            Text("Подтвердить")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor((Color.white).opacity(0.9))
                                .offset(y: -1)
                            
                        }
                        
                    }
                    
                }
                
            }.blur(radius: picturesShown ? 2 : 0)
            
            // picturesList
            if picturesShown {
                
                ZStack{
                    
                    // background
                    RoundedRectangle(cornerRadius: 15)
                        .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 0.64, green: 0.61, blue: 0.96, opacity: 0.3), Color(red: 0.64, green: 0.61, blue: 0.96, opacity: 0.3)]), startPoint: .topTrailing, endPoint: .bottomLeading))
                        .frame(width: 260, height: 345)
                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.60), Color(red: 1, green: 1, blue: 1, opacity: 0.30)]), startPoint: .topTrailing, endPoint: .bottomLeading), lineWidth: 1))
                    
                    // list
                    VStack(spacing: 10){
                        
                        // 1 row
                        HStack(spacing: 10){
                            
                            Button(action: {
                                data.goalPicture = "guitar"
                                UserDefaults.standard.set("guitar", forKey: "goalPicture")
                                picturesShown.toggle()
                            }) {
                                RoundedRectangle(cornerRadius: 5)
                                    .fill((Color.white).opacity(0.4))
                                    .frame(width: 70, height: 70)
                                    .overlay(Image("guitar")
                                        .resizable()
                                        .frame(width: 65, height: 65))
                                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.60), Color(red: 1, green: 1, blue: 1, opacity: 0.30)]), startPoint: .topTrailing, endPoint: .bottomLeading), lineWidth: 1))
                            }
                            
                            Button(action: {
                                data.goalPicture = "graduation"
                                UserDefaults.standard.set("graduation", forKey: "goalPicture")
                                picturesShown.toggle()
                            }) {
                                RoundedRectangle(cornerRadius: 5)
                                    .fill((Color.white).opacity(0.4))
                                    .frame(width: 70, height: 70)
                                    .overlay(Image("graduation")
                                        .resizable()
                                        .frame(width: 65, height: 65))
                                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.60), Color(red: 1, green: 1, blue: 1, opacity: 0.30)]), startPoint: .topTrailing, endPoint: .bottomLeading), lineWidth: 1))
                            }
                            
                            Button(action: {
                                data.goalPicture = "homepod"
                                UserDefaults.standard.set("homepod", forKey: "goalPicture")
                                picturesShown.toggle()
                            }) {
                                RoundedRectangle(cornerRadius: 5)
                                    .fill((Color.white).opacity(0.4))
                                    .frame(width: 70, height: 70)
                                    .overlay(Image("homepod")
                                        .resizable()
                                        .frame(width: 65, height: 65))
                                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.60), Color(red: 1, green: 1, blue: 1, opacity: 0.30)]), startPoint: .topTrailing, endPoint: .bottomLeading), lineWidth: 1))
                            }
                            
                        }
                        
                        // 2 row
                        HStack(spacing: 10){
                            
                            Button(action: {
                                data.goalPicture = "camera"
                                UserDefaults.standard.set("camera", forKey: "goalPicture")
                                picturesShown.toggle()
                            }) {
                                RoundedRectangle(cornerRadius: 5)
                                    .fill((Color.white).opacity(0.4))
                                    .frame(width: 70, height: 70)
                                    .overlay(Image("camera")
                                        .resizable()
                                        .frame(width: 65, height: 65))
                                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.60), Color(red: 1, green: 1, blue: 1, opacity: 0.30)]), startPoint: .topTrailing, endPoint: .bottomLeading), lineWidth: 1))
                            }
                            
                            Button(action: {
                                data.goalPicture = "travelling"
                                UserDefaults.standard.set("travelling", forKey: "goalPicture")
                                picturesShown.toggle()
                            }) {
                                RoundedRectangle(cornerRadius: 5)
                                    .fill((Color.white).opacity(0.4))
                                    .frame(width: 70, height: 70)
                                    .overlay(Image("travelling")
                                        .resizable()
                                        .frame(width: 65, height: 65))
                                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.60), Color(red: 1, green: 1, blue: 1, opacity: 0.30)]), startPoint: .topTrailing, endPoint: .bottomLeading), lineWidth: 1))
                            }
                            
                            Button(action: {
                                data.goalPicture = "laptop"
                                UserDefaults.standard.set("laptop", forKey: "goalPicture")
                                picturesShown.toggle()
                            }) {
                                RoundedRectangle(cornerRadius: 5)
                                    .fill((Color.white).opacity(0.4))
                                    .frame(width: 70, height: 70)
                                    .overlay(Image("laptop")
                                        .resizable()
                                        .frame(width: 65, height: 65))
                                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.60), Color(red: 1, green: 1, blue: 1, opacity: 0.30)]), startPoint: .topTrailing, endPoint: .bottomLeading), lineWidth: 1))
                            }
                            
                        }
                        
                        // 3 row
                        HStack(spacing: 10){
                            
                            Button(action: {
                                data.goalPicture = "book"
                                UserDefaults.standard.set("book", forKey: "goalPicture")
                                picturesShown.toggle()
                            }) {
                                RoundedRectangle(cornerRadius: 5)
                                    .fill((Color.white).opacity(0.4))
                                    .frame(width: 70, height: 70)
                                    .overlay(Image("book")
                                        .resizable()
                                        .frame(width: 65, height: 65))
                                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.60), Color(red: 1, green: 1, blue: 1, opacity: 0.30)]), startPoint: .topTrailing, endPoint: .bottomLeading), lineWidth: 1))
                            }
                            
                            Button(action: {
                                data.goalPicture = "reccamera"
                                UserDefaults.standard.set("reccamera", forKey: "goalPicture")
                                picturesShown.toggle()
                            }) {
                                RoundedRectangle(cornerRadius: 5)
                                    .fill((Color.white).opacity(0.4))
                                    .frame(width: 70, height: 70)
                                    .overlay(Image("reccamera")
                                        .resizable()
                                        .frame(width: 65, height: 65))
                                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.60), Color(red: 1, green: 1, blue: 1, opacity: 0.30)]), startPoint: .topTrailing, endPoint: .bottomLeading), lineWidth: 1))
                            }
                            
                            Button(action: {
                                data.goalPicture = "diamond"
                                UserDefaults.standard.set("diamond", forKey: "goalPicture")
                                picturesShown.toggle()
                            }) {
                                RoundedRectangle(cornerRadius: 5)
                                    .fill((Color.white).opacity(0.4))
                                    .frame(width: 70, height: 70)
                                    .overlay(Image("diamond")
                                        .resizable()
                                        .frame(width: 65, height: 65))
                                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.60), Color(red: 1, green: 1, blue: 1, opacity: 0.30)]), startPoint: .topTrailing, endPoint: .bottomLeading), lineWidth: 1))
                            }
                            
                        }
                        
                        // 4 row
                        HStack(spacing: 10){
                            
                            Button(action: {
                                data.goalPicture = "moneytree"
                                UserDefaults.standard.set("moneytree", forKey: "goalPicture")
                                picturesShown.toggle()
                            }) {
                                RoundedRectangle(cornerRadius: 5)
                                    .fill((Color.white).opacity(0.4))
                                    .frame(width: 70, height: 70)
                                    .overlay(Image("moneytree")
                                        .resizable()
                                        .frame(width: 65, height: 65))
                                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.60), Color(red: 1, green: 1, blue: 1, opacity: 0.30)]), startPoint: .topTrailing, endPoint: .bottomLeading), lineWidth: 1))
                            }
                            
                            Button(action: {
                                data.goalPicture = "paint"
                                UserDefaults.standard.set("paint", forKey: "goalPicture")
                                picturesShown.toggle()
                            }) {
                                RoundedRectangle(cornerRadius: 5)
                                    .fill((Color.white).opacity(0.4))
                                    .frame(width: 70, height: 70)
                                    .overlay(Image("paint")
                                        .resizable()
                                        .frame(width: 65, height: 65))
                                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.60), Color(red: 1, green: 1, blue: 1, opacity: 0.30)]), startPoint: .topTrailing, endPoint: .bottomLeading), lineWidth: 1))
                            }
                            
                            Button(action: {
                                
                                if userImage != UIImage(named: "image") {
                                    picturesShown.toggle()
                                }
                                
                                else {
                                    pickerShown = true
                                }
                                
                            }) {
                                RoundedRectangle(cornerRadius: 5)
                                    .fill((Color("a39cf4")).opacity(1))
                                    .frame(width: 70, height: 70)
                                    .overlay(Image(uiImage: userImage)
                                        .resizable()
                                        .frame(width: 65, height: 65)
                                        .cornerRadius(5))
                            }
                            
                        }
                        
                    }
                    
                }
                
            }
            
        }.sheet(isPresented: $pickerShown, content: {
            PhotoPicker(userImage: $userImage)
        })
        
    }
}


struct newGoalView_Previews: PreviewProvider {
    static var previews: some View {
        newGoalView(goalShown: .constant(false))
            .environmentObject(UserData())
            .preferredColorScheme(.dark)
    }
}
