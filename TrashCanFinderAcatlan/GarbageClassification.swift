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
    let address: String
    let mapIcon: String
    
    static let classifications = [
        GarbageClassification(
            key: "0",
            readableName: "Colillas",
            trashPoints: 5,
            iconName: "cigarettes_icon",
            address: "Puedes encontrar un contenedor para este tipo de basura a un costado del edificio A4",
            mapIcon: "1"
        ),
        GarbageClassification(
            key: "1",
            readableName: "Papel",
            trashPoints: 10,
            iconName: "paper_icon",
            address: "Puedes encontrar un contenedor para este tipo de basura a un costado del edificio A4",
            mapIcon: "2"
        ),
        GarbageClassification(
            key: "2",
            readableName: "Cartón",
            trashPoints: 10,
            iconName: "cardboard_icon",
            address: "Puedes encontrar un contenedor para este tipo de basura a un costado del edificio A4",
            mapIcon: "3"
        ),
        GarbageClassification(
            key: "3",
            readableName: "Pet",
            trashPoints: 10,
            iconName: "pet_icon",
            address: "Puedes encontrar un contenedor para este tipo de basura a un costado del edificio A4",
            mapIcon: "4"
        ),
        GarbageClassification(
            key: "4",
            readableName: "Orgánico",
            trashPoints: 10,
            iconName: "organic_icon",
            address: "Puedes encontrar un contenedor para este tipo de basura a un costado del edificio A4",
            mapIcon: "5"
        ),
        GarbageClassification(
            key: "5",
            readableName: "Metal",
            trashPoints: 50,
            iconName: "metal_icon",
            address: "Puedes encontrar un contenedor para este tipo de basura a un costado del edificio A4",
            mapIcon: "1"
        ),
        GarbageClassification(
            key: "6",
            readableName: "Pilas",
            trashPoints: 50,
            iconName: "battery_icon",
            address: "Puedes encontrar un contenedor para este tipo de basura a un costado del edificio A4",
            mapIcon: "2"
        ),
        GarbageClassification(
            key: "7",
            readableName: "Vidrio",
            trashPoints: 50,
            iconName: "glass_icon",
            address: "Puedes encontrar un contenedor para este tipo de basura a un costado del edificio A4",
            mapIcon: "3"
        ),
        GarbageClassification(
            key: "8",
            readableName: "Electrónicos",
            trashPoints: 100,
            iconName: "electronics_icon",
            address: "Puedes encontrar un contenedor para este tipo de basura a un costado del edificio A4",
            mapIcon: "4"
        ),
        GarbageClassification(
            key: "9",
            readableName: "Otros",
            trashPoints: 5,
            iconName: "other_icon",
            address: "Puedes encontrar un contenedor para este tipo de basura a un costado del edificio A4",
            mapIcon: "5"
        )
    ]
    
    init(key: String, readableName: String, trashPoints: Int, iconName: String, address: String, mapIcon: String) {
        self.key = key
        self.readableName = readableName
        self.trashPoints = trashPoints
        self.iconName = iconName
        self.address = address
        self.mapIcon = mapIcon
    }
    
}
