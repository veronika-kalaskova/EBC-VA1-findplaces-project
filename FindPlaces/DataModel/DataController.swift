//
//  DataController.swift
//  FindPlaces
//
//  Created by Veronika Kalášková on 12.06.2023.
//

import Foundation
import CoreData
import MapKit

class DataController: ObservableObject {
    
    let container = NSPersistentContainer(name: "FindPlacesModel")
    
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Failed to load data in DataController \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved !!")
        } catch {
            print("Data not saved !!")
        }
    }
    
    func addPoi(name: String, title: String, coordinates: CLLocationCoordinate2D ,context: NSManagedObjectContext) {
        let poi = Points(context: context)
        poi.id = UUID()
        poi.name = name
        poi.title = title
        poi.latitude = coordinates.latitude
        poi.longitude = coordinates.longitude
        
        save(context: context)

    }
}
