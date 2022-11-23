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
    
    static let classifications = [
        GarbageClassification(key: "0", readableName: "Colillas", trashPoints: 5),
        GarbageClassification(key: "1", readableName: "Papel", trashPoints: 10),
        GarbageClassification(key: "2", readableName: "Cartón", trashPoints: 10),
        GarbageClassification(key: "3", readableName: "Pet", trashPoints: 10),
        GarbageClassification(key: "4", readableName: "Orgánico", trashPoints: 10),
        GarbageClassification(key: "5", readableName: "Latas", trashPoints: 50),
        GarbageClassification(key: "6", readableName: "Pilas", trashPoints: 50),
        GarbageClassification(key: "7", readableName: "Vidrio", trashPoints: 50),
        GarbageClassification(key: "8", readableName: "Electrónicos", trashPoints: 100),
        GarbageClassification(key: "9", readableName: "Otros", trashPoints: 5)
    ]
    
    init(key: String, readableName: String, trashPoints: Int) {
        self.key = key
        self.readableName = readableName
        self.trashPoints = trashPoints
    }
    
}
