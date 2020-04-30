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
    
    private var plantIndex: Int {
        store.plants.firstIndex(where: { $0.id == plant.id })!
    }
    
    @State private var showImagePicker: Bool = false
    @State private var editDaysBetweenWater: Bool = false
    
    @State private var isSheetsPresented: Bool = false
    
    
    
    var body: some View {
            VStack {
                Text("\(plant.cupsOfWater) cups of water")
                Text("\(plant.daysBetweenWater) days between water")
                Button(action: {
                    self.isSheetsPresented = true
                    self.editDaysBetweenWater = true
                }) {
                    Text("\(plant.daysBetweenWater) days between water")
                }
                
                
                Text("Next water on \(plant.nextWater)")
                plant.image?.resizable().scaledToFit()
                Button(action: {
                    self.isSheetsPresented = true
                    self.showImagePicker = true
                }) {
                    HStack{
                        Image(systemName: "camera.fill")
                            .font(.title)
                    }
                }
            }
                .sheet(isPresented: self.$isSheetsPresented, onDismiss: {
                    self.isSheetsPresented = false
                    print("DISMISS SHEET")
                }) {
                if (self.showImagePicker) {
                    PhotoCaptureView(showImagePicker: self.$showImagePicker, index: self.plantIndex).environmentObject(self.store)
                } else if (self.editDaysBetweenWater) {
                        EditValueView(plant: self.plant, editDaysBetweenWater: self.$editDaysBetweenWater).environmentObject(self.store)
                    }
            }
                
            .navigationBarTitle(plant.name)
        
    }
}

struct PlantDetails_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView { PlantDetails(plant: testData[1]) }
    }
}
