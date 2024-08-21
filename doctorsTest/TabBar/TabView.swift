//
//  TabView.swift
//  doctorsTest
//
//  Created by Сергей on 17.08.2024.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            MainView()
                .environmentObject(MainViewModel())
                .tabItem {
                    Label("Главная", systemImage: "house.fill")
                        
                }
            AppointmentView()
                .tabItem {
                    Label("Приёмы", systemImage: "list.clipboard.fill")
                        
                }
            ChatView()
                .tabItem {
                    Label("Чат", systemImage: "message.fill")
                        
                }
            ProfileView()
                .tabItem {
                    Label("Профиль", systemImage: "person.fill")
                        
                }
            
        }
        .accentColor(Color.pinkCalc)
        .onAppear {
            UITabBar.appearance().backgroundColor = UIColor.white
        }
    }
}

#Preview {
    TabBar()
}
