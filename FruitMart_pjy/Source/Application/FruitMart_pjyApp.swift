//
//  FruitMart_pjyApp.swift
//  FruitMart_pjy
//
//  Created by 박정용 on 4/4/24.
//

import SwiftUI
import SwiftData

@main
struct FruitMart_pjyApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            Home()
                .environmentObject(Store())
        }
        .modelContainer(sharedModelContainer)
    }
}

