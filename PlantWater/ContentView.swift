//
//  ContentView.swift
//  PlantWater
//
//  Created by Marcus Smith on 4/26/20.
//  Copyright © 2020 marcusmth. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var store = PlantStore()
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Button(action: addPlant) {
                        Text("Add Plant")
                    }
                }
                Section {
                    ForEach(store.plants) { plant in
                        PlantCell(plant: plant)
                    }
                    .onDelete(perform: delete)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Plants")
        }
    }
    
    func addPlant() {
        store.plants.append(Plant(name: "New Plant", daysBetweenWater: 99, cupsOfWater: 100))
    }
    
    func delete(at offsets: IndexSet) {
        store.plants.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: PlantStore(plants: testData))
    }
}

struct PlantCell: View {
    let plant: Plant
    var body: some View {
        NavigationLink(destination: PlantDetails(plant: plant)){
            HStack{
                Image(systemName: "photo")
                VStack(alignment: .leading) {
                    Text(plant.name)
                    Text("water button")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}
