//
//  AreaDistribution.swift
//  Santillana-Demo-AR-Experiencia-Residuos
//
//  Created by Eduardo Quintero on 6/18/19.
//  Copyright © 2019 Alejandro Mendoza. All rights reserved.
//

import Foundation
import SceneKit

func areaDistribution(Planes: [SCNNode]) -> [Float] {
    
    var areas = [Float]()
    var areaTotal: Float = 0
    var areasPercent = [Float]()
    
    for i in Planes{
        var radius = higherBounding(i.boundingBox.max)
        areas.append(areaBounding(radius))
        areaTotal = areaTotal + areaBounding(radius)
    }
    
    for i in areas {
        var percent = (i / areaTotal )
        areasPercent.append(percent)
        
        
    }
    
    return areasPercent
}
