//
//  PlantStore.swift
//  PlantWater
//
//  Created by Marcus Smith on 4/26/20.
//  Copyright © 2020 marcusmth. All rights reserved.
//

import SwiftUI
import Combine

class PlantStore: ObservableObject
{
    @Published var plants: [Plant]
    
    init(plants: [Plant] = [])
    {
        self.plants = plants
    }
}
