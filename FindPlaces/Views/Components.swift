//
//  Components.swift
//  FindPlaces
//
//  Created by Veronika Kalášková on 15.06.2023.
//

import SwiftUI


struct ButtonNavigate: View {
    var text: String
    var image: String
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        ZStack {
            
            Linear(colorLinear1: "LinearButton1", colorLinear2: "LinearButton2", colorLinear3: "LinearButton3")
                .cornerRadius(19)
            
            VStack {
                Image(image)
                    .resizable()
                    .frame(width: width, height: height)
                
                Text(text)
                    .foregroundColor(.black)
                    .font(.system(size: 15))
                    .bold()
            }
        }.frame(width: 110, height: 115)
    }
    
}


struct ButtonLarge: View {
    var name: String
    
    var body: some View {
        ZStack {
            Linear(colorLinear1: "LinearButton1", colorLinear2: "LinearButton2", colorLinear3: "LinearButton3")
                .cornerRadius(19)
            
                Text(name)
                    .foregroundColor(.black)
                    .bold()
            }
    }
}

struct Linear: View {
    var colorLinear1: String
    var colorLinear2: String
    var colorLinear3: String
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color(colorLinear1), Color(colorLinear2), Color(colorLinear3)]),
                       startPoint: .topTrailing,
                       endPoint: .bottomLeading)
    }
}
    
