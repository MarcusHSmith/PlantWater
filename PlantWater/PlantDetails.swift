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
    var body: some View {
            VStack {
                Text(plant.name)
                Text("\(plant.cupsOfWater) cups of water")
                Text("\(plant.daysBetweenWater) days between water")
            }
            .navigationBarTitle("Title")
        
    }
}

struct PlantDetails_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView { PlantDetails(plant: testData[0]) }
    }
}
