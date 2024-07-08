//
//  MainView.swift
//  FindPlaces
//
//  Created by Veronika Kalášková on 20.05.2023.
//

import SwiftUI
import MapKit



struct MainView: View {
    
    @State var radius: Double = 0
    @State var landmarks: [Landmark] = [Landmark]()
 
    var body: some View {
        NavigationView {
            ZStack(alignment: .center) {
                Color("Background").ignoresSafeArea()
                
                VStack {

                    Linear(colorLinear1: "Linear1", colorLinear2: "Linear2", colorLinear3: "Linear3")
                        .frame(height: 100)
                        .mask(Text("Find Places")
                            .font(.largeTitle)
                            .fontWeight(.black))
                        
                        
                    
                    HStack {
                        NavigationLink(destination: SavedView()
                        ) {
                            ButtonNavigate(text: "Saved", image: "Icon", width: 40, height: 50)
                        }
                        
                        NavigationLink(destination: OpenMapView(landmarks: $landmarks)
                        ) {
                            ButtonNavigate(text: "Open Map", image: "Globe", width: 58, height: 55)
                        }
                    }
                    .padding(.bottom, 100)
                    .padding(.top, 20)

                    VStack {
                        
                        Slider (value: $radius, in: 0...100, step: 1.0)               
                        
                        Text("Radius: \(Int(radius)) Km").bold()
                    }
                    .frame(width: 220)
                    .padding(.bottom, 50)
                    
                    NavigationLink(destination: GeneratedView(landmarks: $landmarks, radius: radius * 1000)) {
                        ButtonLarge(name: "Generate Point")
                                .frame(width: 240, height: 70)
                    }
                }
            }
        }

    }
}
    
