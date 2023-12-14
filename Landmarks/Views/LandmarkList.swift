//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Ivan Almada on 10/20/23.
//

import SwiftUI

struct LandmarkList: View {

    @State private var showFavoritesOnly = true
    @StateObject private var modelData = ModelData()

    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { !showFavoritesOnly || $0.isFavorite }
    }

    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach (filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                            .environmentObject(modelData)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
