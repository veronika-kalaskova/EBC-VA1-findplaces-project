//
//  GeneratedView.swift
//  FindPlaces
//
//  Created by Veronika Kalášková on 10.06.2023.
//

import Foundation
import SwiftUI
import MapKit

struct GeneratedView: View {
    
    @Environment (\.managedObjectContext) var ManagedObjContext
    @Environment(\.dismiss) var dismiss
    
    @Binding var landmarks: [Landmark]
    
    @ObservedObject var locationManager = LocationManager()
    @State var radius: Double
    @State private var search: String = ""
    
    @State private var randomPlacemark: MKPlacemark? = nil
    
    func getRandomPOI(completion: @escaping (MKPlacemark?) -> Void) {
        let request = MKLocalPointsOfInterestRequest(center: CLLocationCoordinate2D(latitude: locationManager.location?.coordinate.latitude ?? 0, longitude: locationManager.location?.coordinate.longitude ?? 0), radius: radius)
        
        
        request.pointOfInterestFilter = MKPointOfInterestFilter(including: [
            .restaurant,
            .cafe,
            .park,
            .museum,
            .aquarium,
            .bakery,
            .beach,
            .bakery,
            .nationalPark,
            .amusementPark,
            .campground
        ])


        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            if let mapItems = response?.mapItems {
                if let randomItem = mapItems.randomElement() {
                    completion(randomItem.placemark)
                }
            }
        }
    }
    
    private func navigate(landmark: [Landmark]) {
        let url = URL(string: "maps://?saddr=&daddr=\( landmarks.first!.coordinate.latitude),\(landmarks.first!.coordinate.longitude)")
        if UIApplication.shared.canOpenURL(url!) {
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        }
    }

    var body: some View {
        
        NavigationView {
            ZStack {
                Color("Background").ignoresSafeArea()
                VStack() {
                    VStack {
                       
                        Linear(colorLinear1: "Linear1", colorLinear2: "Linear2", colorLinear3: "Linear3")
                            .frame(height: 30)
                            .mask(Text(landmarks.first?.name ?? "")
                                .font(.title)
                                .fontWeight(.black))
                        
                        Text(landmarks.first?.title ?? "")
                            .font(.headline)
                            .foregroundColor(.gray)
                        
                        Button(action: {
                            navigate(landmark: landmarks)
                        }, label: {
                            ButtonLarge(name: "Navigate")
                                .frame(width: 195, height: 60)
                                .padding(.top)
                        })
                        
                        
                    }
                    .padding(.horizontal)
                    .padding(.top)

                    MapView(landmarks: landmarks)
                        .cornerRadius(20)
                        .padding(20)
                        .onAppear() {
                            if (radius != 0) {
                                getRandomPOI { (placemark) in
                                    if let placemark = placemark {
                                        self.randomPlacemark = placemark
                                        landmarks.removeAll()
                                        let landmark = Landmark(placemark: placemark)
                                        landmarks.append(landmark)
                                    } else {
                                        print("Místo nebylo nalezeno.")
                                    }
                                }
                            }
                        }
                }
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button("Save") {
                    DataController().addPoi(name: landmarks.first?.name ?? "", title: landmarks.first?.title ?? "", coordinates: landmarks.first?.coordinate ?? CLLocationCoordinate2D.init(), context: ManagedObjContext)
                    landmarks.append(Landmark(placemark: randomPlacemark!))
                    dismiss()
                }
            }
        }
    }
}

