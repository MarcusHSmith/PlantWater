//
//  PlantDetails.swift
//  PlantWater
//
//  Created by Marcus Smith on 4/26/20.
//  Copyright © 2020 marcusmth. All rights reserved.
//

import SwiftUI

struct PlantDetails: View {
    @EnvironmentObject var store: PlantStore
    
    var plant: Plant
    
    private var plantIndex: Int {
        store.plants.firstIndex(where: { $0.id == plant.id })!
    }
    
    @State private var showImagePicker: Bool = false
    @State private var daysUntilNextWater: Int?
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("\(plant.cupsOfWater) cups of water")
                Text("\(plant.daysBetweenWater) days between water")
                TextField("Edit Days", value: $daysUntilNextWater, formatter: NumberFormatter(), onCommit: {
                    if let daysUntilNextWater = self.daysUntilNextWater {
                        self.store.plants[self.plantIndex].daysBetweenWater = daysUntilNextWater
                    }
                })
                Text("Next water on \(plant.nextWater)")
            }
            VStack {
                plant.image?.resizable().scaledToFit().padding()
                Button(action: {
                    self.showImagePicker = true
                }) {
                    HStack{
                        Image(systemName: "camera.fill")
                            .font(.title)
                    }
                }
                Button(action: {
                    self.store.plants[self.plantIndex].lastWater = Date()
                }) {
                    Text("WATERED")
                }
                Spacer()
            }
        }
            .sheet(isPresented: self.$showImagePicker) {
                    PhotoCaptureView(showImagePicker: self.$showImagePicker, index: self.plantIndex).environmentObject(self.store)
                
            }
            .navigationBarTitle(plant.name)
    }
}

struct PlantDetails_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView { PlantDetails(plant: testData[1]) }
    }
}
