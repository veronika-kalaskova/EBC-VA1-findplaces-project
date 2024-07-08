//
//  SavedView.swift
//  FindPlaces
//
//  Created by Veronika Kalášková on 12.06.2023.
//

import SwiftUI
import EventKit
import EventKitUI

struct SavedView: View {
    
    @Environment(\.managedObjectContext) var ManagedObjContext
    @FetchRequest(sortDescriptors: []) var pois: FetchedResults<Points>
    
    private func deletePoi(offsets: IndexSet) {
        offsets.map { pois[$0] }
            .forEach(ManagedObjContext.delete)

        DataController().save(context: ManagedObjContext)
    }
    
    var body: some View {
        
            VStack {
                Linear(colorLinear1: "Linear1", colorLinear2: "Linear2", colorLinear3: "Linear3")
                    .frame(height: 100)
                    .mask(Text("Saved Locations")
                        .font(.largeTitle)
                        .fontWeight(.black))
                
                NavigationView {
                    List {
                        ForEach(pois) { poi in
                            HStack {
                                VStack(alignment: .leading, spacing: 5) {

                                    Text(poi.name ?? "")
                                        .foregroundColor(Color("Linear2"))
                                        .fontWeight(.heavy)
                                        .font(.title3)
                                        
                                    
                                    Text(poi.title ?? "")
                                        .foregroundColor(.gray)
                                        .font(.subheadline)
                                        
                                    
                                }.padding(.horizontal)
                                Spacer()
                                VStack {
                                    
                                    Image(systemName: "plus")
                                        .font(.system(size: 20))
                                        .scaleEffect(1.5)
                                        .foregroundColor(Color("Linear2"))
                                        .fontWeight(.regular)
                                        .padding(.bottom)
                                    
                                    Text("Add to iCal")
                                        .foregroundColor(Color("Linear2"))
                                        .fontWeight(.heavy)
                                        
                                    
                                }.padding(.horizontal)
                            }
                            .frame(width: 360, height: 135)
                            .background(Color("BackgroundButton"))
                            .cornerRadius(18)
                        }.onDelete(perform: deletePoi)
                    }
                    .listStyle(.plain)
                }
            }
        }
    }

