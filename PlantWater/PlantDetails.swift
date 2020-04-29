//
//  PlantDetails.swift
//  PlantWater
//
//  Created by Marcus Smith on 4/26/20.
//  Copyright © 2020 marcusmth. All rights reserved.
//

import SwiftUI

struct PlantDetails: View {
    let plant: Plant
    
    @State private var showImagePicker: Bool = false
    @State private var image: Image? = nil
    
    var body: some View {
            VStack {
                Text("\(plant.cupsOfWater) cups of water")
                Text("\(plant.daysBetweenWater) days between water")
                image?.resizable()
                    .scaledToFit()
                Button(action: {
                    self.showImagePicker = true
                }) {
                    HStack{
                        Text("HERE")
                        Text("AND")
                        Image(systemName: "Camera")
                            .font(.title)
                            .foregroundColor(.red)
                    }
                }
            }
            .sheet(isPresented: self.$showImagePicker) {
                PhotoCaptureView(showImagePicker: self.$showImagePicker, image: self.$image)
            }
            .navigationBarTitle(plant.name)
        
    }
}

struct PlantDetails_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView { PlantDetails(plant: testData[1]) }
    }
}
