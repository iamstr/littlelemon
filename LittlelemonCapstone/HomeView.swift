//
//  HomeView.swift
//  LittlelemonCapstone
//
//  Created by Abdisatar Mohamed on 28/04/2024.
//

import SwiftUI

struct HomeView: View {
    let persistence = PersistenceController.shared
    var body: some View {
        
        TabView{
            MenuView()
                .tabItem { Label("Home", systemImage: "list.dash") }
                .environment(\.managedObjectContext, persistence.container.viewContext)
            UserProfileView()
                .tabItem { Label("Profile", systemImage: "square.and.pencil") }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HomeView()
}
