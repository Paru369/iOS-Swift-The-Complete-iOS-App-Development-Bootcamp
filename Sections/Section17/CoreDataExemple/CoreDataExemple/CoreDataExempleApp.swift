//
//  CoreDataExempleApp.swift
//  CoreDataExemple
//
//  Created by Paulo Pinheiro on 11/29/23.
//

import SwiftUI

@main
struct CoreDataExempleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
