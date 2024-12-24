//
//  _00_Days_of_SwiftApp.swift
//  100 Days of Swift
//
//  Created by Vaishnavi Wahgule on 24/12/24.
//

import SwiftUI

@main
struct _00_Days_of_SwiftApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
