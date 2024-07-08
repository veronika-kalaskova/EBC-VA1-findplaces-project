//
//  OpenMapView.swift
//  FindPlaces
//
//  Created by Veronika Kalášková on 10.06.2023.
//

import Foundation
import MapKit
import SwiftUI

struct OpenMapView: View {
    
    @ObservedObject var locationManager = LocationManager()
    
    @Environment(\.managedObjectContext) var ManagedObjContext
    @FetchRequest(sortDescriptors: []) var pois: FetchedResults<Points>
    
    @Binding var landmarks: [Landmark]
    @State var detail: Bool = false
    
    var total: Int {
        return self.landmarks.count
    }
    
    func convertFetchedPoints(pois: FetchedResults<Points>) {
        landmarks = pois.map { poi in
            let placemark = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: poi.latitude, longitude: poi.longitude))
            let landmark = Landmark(placemark: placemark)
            return landmark
        }
    }
    
    func refreshPoints() {
        convertFetchedPoints(pois: pois)
    }
    
 
    var body: some View {
            VStack {
                MapView(landmarks: landmarks)
                    .cornerRadius(20)
                    .padding(20)
                    .onAppear() {
                        refreshPoints()
                    }
                
                Text("Total Places: \(total)")
                    .font(.title2)
                    .bold()

            }.padding(.bottom, 40)
    }
}
