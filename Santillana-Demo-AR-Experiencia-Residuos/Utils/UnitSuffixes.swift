//
//  UnitSuffixes.swift
//  Santillana-Demo-AR-Experiencia-Residuos
//
//  Created by Alejandro Mendoza on 6/17/19.
//  Copyright © 2019 Alejandro Mendoza. All rights reserved.
//

import Foundation

func getSuffixesFor(_ time: Time) -> (String, String){
    let suffixes: (String, String)
    
    switch time {
    case .day:
        suffixes = ("día", "días")
    case .month:
        suffixes = ("mes", "meses")
    case .year:
        suffixes = ("año", "años")
    }
    
    return suffixes
}

func getSuffixesFor(_ mass: Mass) -> (String, String){
    let suffixes: (String, String)
    
    switch mass {
    case .kilo:
        suffixes = ("kilo", "kilos")
    }
    
    return suffixes
}
