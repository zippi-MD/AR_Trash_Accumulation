//
//  Enumerators.swift
//  Santillana-Demo-AR-Experiencia-Residuos
//
//  Created by Alejandro Mendoza on 6/13/19.
//  Copyright © 2019 Alejandro Mendoza. All rights reserved.
//

import Foundation

enum Orientations {
    case vertical, horizontal
}

enum AppState {
    case detectingPlanes
    case retriveInfo
    case displayTrash
    case changingSelectedTime
}

enum Time: Int, CaseIterable {
    case day = 1
    case month = 30
    case year = 365
    
    
}

enum TrashModels: String, CaseIterable {
    case can = "lata"
    case bottle  = "botella"
    case bagx1 = "bolsa1Kilos"
    case bagx5 = "bolsa5Kilos"
    case bagx10 = "bolsa10Kilos"
    case bagx50 = "bolsa50Kilos"
}

enum Mass {
    case kilo
}
