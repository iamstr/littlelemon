//
//  LittlelemonCapstoneApp.swift
//  LittlelemonCapstone
//
//  Created by Abdisatar Mohamed on 26/04/2024.
//

import SwiftUI

@main
struct LittlelemonCapstoneApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            OnboardingView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
