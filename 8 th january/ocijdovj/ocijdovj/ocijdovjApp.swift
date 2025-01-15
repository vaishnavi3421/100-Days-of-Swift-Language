//
//  ocijdovjApp.swift
//  ocijdovj
//
//  Created by Vaishnavi Wahgule on 08/01/25.
//

import SwiftUI

@main
struct ocijdovjApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
