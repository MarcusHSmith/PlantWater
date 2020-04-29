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
    
    let plant: Plant
    
    var plantIndex: Int {
        store.plants.firstIndex(where: { $0.id == plant.id })!
    }
    
    @State private var showImagePicker: Bool = false
    
    var body: some View {
            VStack {
                Text("\(plant.cupsOfWater) cups of water")
                Text("\(plant.daysBetweenWater) days between water")
                plant.image?.resizable().scaledToFit()
                Button(action: {
                    self.showImagePicker = true
                }) {
                    HStack{
                        Image(systemName: "camera.fill")
                            .font(.title)
                    }
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
