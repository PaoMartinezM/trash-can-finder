//
//  GarbageClassification.swift
//  TrashCanFinderAcatlan
//
//  Created by Iván Martínez on 22/11/22.
//

import Foundation

class GarbageClassification {
    
    let key: String
    let readableName: String
    let trashPoints: Int
    let iconName: String
    
    static let classifications = [
        GarbageClassification(key: "0", readableName: "Colillas", trashPoints: 5, iconName: "cigarettes_icon"),
        GarbageClassification(key: "1", readableName: "Papel", trashPoints: 10, iconName: "paper_icon"),
        GarbageClassification(key: "2", readableName: "Cartón", trashPoints: 10, iconName: "paper_icon"),
        GarbageClassification(key: "3", readableName: "Pet", trashPoints: 10, iconName: "pet_icon"),
        GarbageClassification(key: "4", readableName: "Orgánico", trashPoints: 10, iconName: "organic_icon"),
        GarbageClassification(key: "5", readableName: "Metal", trashPoints: 50, iconName: "metal_icon"),
        GarbageClassification(key: "6", readableName: "Pilas", trashPoints: 50, iconName: "battery_icon"),
        GarbageClassification(key: "7", readableName: "Vidrio", trashPoints: 50, iconName: "glass_icon"),
        GarbageClassification(key: "8", readableName: "Electrónicos", trashPoints: 100, iconName: "electronics_icon"),
        GarbageClassification(key: "9", readableName: "Otros", trashPoints: 5, iconName: "other_icon")
    ]
    
    init(key: String, readableName: String, trashPoints: Int, iconName: String) {
        self.key = key
        self.readableName = readableName
        self.trashPoints = trashPoints
        self.iconName = iconName
    }
    
}
