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
}

enum Time: Int {
    case day = 1
    case month = 30
    case year = 365
}
