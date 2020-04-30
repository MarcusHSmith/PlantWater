//
//  Plant.swift
//  PlantWater
//
//  Created by Marcus Smith on 4/26/20.
//  Copyright © 2020 marcusmth. All rights reserved.
//

import SwiftUI

struct Plant: Identifiable
{
    var id = UUID()
    var name: String
    var daysBetweenWater: Int
    var cupsOfWater: Double
    var image: Image?
    var lastWater: Date = Date()
    
    var nextWater: Date {
        let timeInterval: TimeInterval = TimeInterval(daysBetweenWater * 24*60*60)
        return lastWater.addingTimeInterval(timeInterval)
    }
}

#if DEBUG
let testData = [
    Plant(name: "53 Hester living room tree", daysBetweenWater: 14, cupsOfWater: 4),
    Plant(name: "Money tree", daysBetweenWater: 4, cupsOfWater: 0.5),
    Plant(name: "Ivy", daysBetweenWater: 31, cupsOfWater: 1),
]
#endif
