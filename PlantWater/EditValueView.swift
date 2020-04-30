//
//  EditValueView.swift
//  PlantWater
//
//  Created by Marcus Smith on 4/29/20.
//  Copyright © 2020 marcusmth. All rights reserved.
//

import SwiftUI

struct EditValueView: View {
    @EnvironmentObject var store: PlantStore
    
    let plant: Plant
    
    var plantIndex: Int {
        store.plants.firstIndex(where: { $0.id == plant.id })!
    }
    
    @Binding var editDaysBetweenWater:Bool
    
    @State private var daysUntilNextWater: Int = 7
    
    var body: some View {
        VStack {
            Text("How many days should you wait between watering \(plant.name)?")
            TextField("days", value: $daysUntilNextWater, formatter: NumberFormatter(), onCommit: {
                self.store.plants[self.plantIndex].daysBetweenWater = self.daysUntilNextWater
                self.editDaysBetweenWater = false
            })
            Spacer()
        }
    .padding()
    }
}
