//
//  PlantDetails.swift
//  PlantWater
//
//  Created by Marcus Smith on 4/26/20.
//  Copyright © 2020 marcusmth. All rights reserved.
//

import UserNotifications
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
                        self.updateNotification()
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
                    self.updateNotification()
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
    
    private func updateNotification() {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [plant.id.uuidString])
        let content = UNMutableNotificationContent()
        content.title = "\(plant.name) is thirsty"
        content.subtitle = "It was last watered on \(plant.lastWater)"
        content.sound = UNNotificationSound.default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: plant.nextWater.timeIntervalSinceNow, repeats: false)
        let request = UNNotificationRequest(identifier: plant.id.uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}

struct PlantDetails_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView { PlantDetails(plant: testData[1]) }
    }
}
