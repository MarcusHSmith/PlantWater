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
    var imageName: String {return name }
    var thumbnailName: String {return name + "Thumb" }
    var daysBetweenWater: Int
    var cupsOfWater: Double
    var image: Image?
}

#if DEBUG
let testData = [
    Plant(name: "53 Hester living room tree", daysBetweenWater: 14, cupsOfWater: 4),
    Plant(name: "Money tree", daysBetweenWater: 4, cupsOfWater: 0.5),
    Plant(name: "Ivy", daysBetweenWater: 31, cupsOfWater: 1),
]
#endif
