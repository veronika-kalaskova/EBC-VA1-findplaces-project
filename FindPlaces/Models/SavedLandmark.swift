//
//  SavedLandmark.swift
//  FindPlaces
//
//  Created by Veronika Kalášková on 12.06.2023.
//

import Foundation
import MapKit

struct SavedLandmark: Identifiable {
    
    let id: UUID
    let name: String
    let title: String
    let coordinates: CLLocationCoordinate2D
        

}
