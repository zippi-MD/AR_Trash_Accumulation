//
//  GarbageDistribution.swift
//  Santillana-Demo-AR-Experiencia-Residuos
//
//  Created by Eduardo Quintero on 6/21/19.
//  Copyright © 2019 Alejandro Mendoza. All rights reserved.
//

import UIKit

func garbageRatio(TrashMass: Float,ratioX50: Float, ratioX10: Float, ratioX5: Float ,ratioX1: Float, ratioCanAndBag: Float) -> [TrashModels: Float] {
    var garbageBags = [TrashModels:Float]()
    
    var garbageBagX50 = TrashMass * ratioX50
    garbageBagX50 = (garbageBagX50) * (1/50)
    garbageBagX50 = Float(Int(garbageBagX50))
    if (garbageBagX50 > 0) {garbageBags[TrashModels.bagx50] = garbageBagX50}
    
    
    
    var garbageBagX10 = TrashMass * ratioX10
    garbageBagX10 = (garbageBagX10) * (1/10)
    garbageBagX10 = Float(Int(garbageBagX10))
    if (garbageBagX10 > 0) {garbageBags[TrashModels.bagx10] = garbageBagX10}
    
    
    var garbageBagX5 = TrashMass * ratioX5
    garbageBagX5 = (garbageBagX5) * (1/5)
    garbageBagX5 = Float(Int(garbageBagX5))
    if (garbageBagX5 > 0) {garbageBags[TrashModels.bagx5] = garbageBagX5}
    
    
    var garbageBagX1 = TrashMass * ratioX1
    garbageBagX1 = Float(Int(garbageBagX1))
    if (garbageBagX1 > 0) {garbageBags[TrashModels.bagx1] = garbageBagX1}
    
    
    var canAndBottle = TrashMass * ratioCanAndBag
    canAndBottle = Float(Int(canAndBottle))
    if (canAndBottle > 0) {
        garbageBags[TrashModels.can] = canAndBottle / 2
        
        garbageBags[TrashModels.bottle] = canAndBottle / 2
        
    }
    
    
    return garbageBags
    
}

func garbageBagsInThePlane(TrashPlanes: [Float], timeLapse: Time) -> [TrashModels: Float]{
    
    var garbageBags = [TrashModels:Float]()
    let higherTrash =  TrashPlanes.max()!
    
    for TrashPlane in TrashPlanes{
        if (TrashPlane == higherTrash){
            
            switch timeLapse {
            case .day:
                garbageBags = garbageRatio(TrashMass: TrashPlane , ratioX50: 0, ratioX10: 0, ratioX5: (3/4), ratioX1: (3/16), ratioCanAndBag: (1/16))
            case .month:
                garbageBags = garbageRatio(TrashMass: TrashPlane, ratioX50: (7/8), ratioX10: (3/32), ratioX5: (1/32), ratioX1: 0, ratioCanAndBag: 1/256)
            case .year:
                var TempTrashPlane = TrashPlane / 4
                garbageBags = garbageRatio(TrashMass: TempTrashPlane, ratioX50: 1, ratioX10: 0, ratioX5: 0, ratioX1: 0, ratioCanAndBag: 0)
           
            }
            
        }else{
            
            switch timeLapse {
            case .day:
                garbageBags = garbageRatio(TrashMass: TrashPlane , ratioX50: 0, ratioX10: 0, ratioX5: (3/8), ratioX1: (3/8), ratioCanAndBag: 2/8)
            case .month:
                garbageBags = garbageRatio(TrashMass: TrashPlane, ratioX50: (10/16), ratioX10: (5/16), ratioX5: (3/64), ratioX1: (1/64), ratioCanAndBag: 0)
            case .year:
                var TempTrashPlane = TrashPlane / 4
                garbageBags = garbageRatio(TrashMass: TempTrashPlane, ratioX50: 7/8, ratioX10: 1/8, ratioX5: 0, ratioX1: 0, ratioCanAndBag: 0)
                
            }
        }
    }
    
    return garbageBags
}
