//
//  TabBarStructure.swift
//  SmokingApp
//
//  Created by Андрей Ефимов on 13.03.2022.
//

import SwiftUI

// Global Score Var
@MainActor class Score: ObservableObject {
    @Published var score: Int = 8
}

// Buttons' struct
struct TabItemData {
    let image: String
    let selectedImage: String
}

// Buttons' View
struct TabItemView: View {
    let data: TabItemData
    let isSelected: Bool
    
    var body: some View {
        VStack {
            if (data.image == "main" && data.selectedImage == "main_a"){
                Image(isSelected ? data.selectedImage : data.image)
                    .resizable()
                    .frame(width: 74, height: 74)
                    .offset(x: 0, y: 0)
            }
            else if (data.image == "economy" && data.selectedImage == "economy_a"){
                Image(isSelected ? data.selectedImage : data.image)
                    .resizable()
                    .frame(width: 81, height: 81)
                    .padding(.top, -7)
            }
            else if (data.image == "achievements" && data.selectedImage == "achievements_a"){
                Image(isSelected ? data.selectedImage : data.image)
                    .resizable()
                    .frame(width: 73, height: 73)
                    .padding(.top, 1)
            }
            else if (data.image == "restart" && data.selectedImage == "restart_a"){
                Image(isSelected ? data.selectedImage : data.image)
                    .resizable()
                    .frame(width: 67, height: 67)
                    .offset(x: 0, y: 0)
            }
        }
    }
}

// Bar View
struct TabBottomView: View {
    
    let tabbarItems: [TabItemData]
    var height: CGFloat = 92
    var width: CGFloat = 377
    @Binding var selectedIndex: Int
    
    var body: some View {
        HStack {
            Spacer(minLength: 105)
            
            ForEach(tabbarItems.indices) { index in
                let item = tabbarItems[index]
                Button {
                    self.selectedIndex = index
                } label: {
                    let isSelected = selectedIndex == index
                    TabItemView(data: item, isSelected: isSelected)
                }.padding(.horizontal, 1)
                    .offset(y: -8)
                
            }
            Spacer(minLength: 103)
            
        }
        .frame(width: 377, height: 92)
        .background(RoundedRectangle(cornerRadius: 20)
                        .fill(Color(red: 1, green: 1, blue: 1, opacity: 0.40))
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.50), Color(red: 1, green: 1, blue: 1, opacity: 0.50)]), startPoint: .trailing, endPoint: .leading), lineWidth: 1)))
    }
}

// Views + TabBar
struct CustomTabView<Content: View>: View {
    
    let tabs: [TabItemData]
    @Binding var selectedIndex: Int
    @ViewBuilder let content: (Int) -> Content
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedIndex) {
                ForEach(tabs.indices) { index in
                    content(index)
                        .tag(index)
                }
            }
            .frame(width: 375, height: 812)
            .offset(y: 34)
            
            VStack {
                TabBottomView(tabbarItems: tabs, selectedIndex: $selectedIndex)
            }.offset(y: 356)
        }
    }
}

// Buttons' logic
enum TabType: Int, CaseIterable {
    case main = 0
    case economy
    case achievements
    case restart
    
    var tabItem: TabItemData {
        switch self {
        case .main:
            return TabItemData(image: "main", selectedImage: "main_a")
        case .economy:
            return TabItemData(image: "economy", selectedImage: "economy_a")
        case .restart:
            return TabItemData(image: "restart", selectedImage: "restart_a")
        case .achievements:
            return TabItemData(image: "achievements", selectedImage: "achievements_a")
        }
    }
}

// Buttons' navigation
struct MainTabView: View {
    
    @State var selectedIndex: Int = 0
    
    var body: some View {
        CustomTabView(tabs: TabType.allCases.map({ $0.tabItem }), selectedIndex: $selectedIndex) { index in
            let type = TabType(rawValue: index) ?? .main
            getTabView(type: type)
        }
    }
    
    @ViewBuilder
    func getTabView(type: TabType) -> some View {
        switch type {
        case .main:
            mainView()
                .offset(y: 5)
        case .economy:
            economyView()
                .offset(y: 5)
        case .achievements:
            achievementsView()
                .offset(y: 5)
        case .restart:
            restartView()
                .offset(y: 5)
        }
    }
}

struct TabBarStructure_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .environmentObject(Score())
    }
}
