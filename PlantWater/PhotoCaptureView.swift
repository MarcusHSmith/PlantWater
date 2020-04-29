//
//  PhotoCaptureView.swift
//  PlantWater
//
//  Created by Marcus Smith on 4/26/20.
//  Copyright © 2020 marcusmth. All rights reserved.
//

import SwiftUI

struct PhotoCaptureView: View {
    @EnvironmentObject var store: PlantStore
    
    @Binding var showImagePicker: Bool
    
    var index: Int
    
    var body: some View {
        ImagePicker(isShown: $showImagePicker, index: index).environmentObject(store)
    }
}

#if DEBUG
struct PhotoCaptureView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoCaptureView(showImagePicker: .constant(false), index: 1)
    }
}
#endif
