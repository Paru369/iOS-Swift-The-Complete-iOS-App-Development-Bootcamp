//
//  Core_Data_TestApp.swift
//  Core Data Test
//
//  Created by Paulo Pinheiro on 11/29/23.
//

import SwiftUI

@main
struct Core_Data_TestApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
