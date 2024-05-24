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
        configurationAppearance()
        return WindowGroup {
            MainTabView()
                .environmentObject(Store())
        }
        .modelContainer(sharedModelContainer)
    }
    
    private func configurationAppearance() {
        // large 디스플레이 모드에서 적용
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(named: "peach")!]
        // inline 디스플레이 모드일 때 적용
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(named: "peach")!]
        UITableView.appearance().backgroundColor = .clear
    }
}

