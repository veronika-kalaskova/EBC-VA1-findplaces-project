//
//  Landmark.swift
//  FindPlaces
//
//  Created by Veronika Kalášková on 10.06.2023.
//

import Foundation
import MapKit

struct Landmark: Identifiable {
    
    let placemark: MKPlacemark
    
    var id: UUID {
        return UUID()
    }
    
    var name: String {
        self.placemark.name ?? ""
    }
    
    var title: String {
        self.placemark.title ?? ""
    }
    
    var coordinate: CLLocationCoordinate2D {
        self.placemark.coordinate
    }
}
