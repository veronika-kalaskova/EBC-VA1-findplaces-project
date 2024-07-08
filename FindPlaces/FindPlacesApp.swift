//
//  FindPlacesApp.swift
//  FindPlaces
//
//  Created by Veronika Kalášková on 20.05.2023.
//

import SwiftUI

@main
struct FindPlacesApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
