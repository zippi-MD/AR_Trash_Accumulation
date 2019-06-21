//
//  GarbageDistribution.swift
//  Santillana-Demo-AR-Experiencia-Residuos
//
//  Created by Eduardo Quintero on 6/21/19.
//  Copyright © 2019 Alejandro Mendoza. All rights reserved.
//

import UIKit

func garbageRatio(TrashMass: Float,ratioX50: Float, ratioX10: Float, ratioX5: Float ,ratioX1: Float, ratioCanAndBag: Float) -> [String: Float] {
    var garbageBags = [String:Float]()
    
    var garbageBagX50 = TrashMass * ratioX50
    garbageBagX50 = (garbageBagX50) * (1/50)
    garbageBagX50 = Float(Int(garbageBagX50))
    if (garbageBagX50 > 0) {garbageBags["garbageBagX50"] = garbageBagX50}
    
    
    
    var garbageBagX10 = TrashMass * ratioX10
    garbageBagX10 = (garbageBagX10) * (1/10)
    garbageBagX10 = Float(Int(garbageBagX10))
    if (garbageBagX50 > 0) {garbageBags["garbageBagX10"] = garbageBagX10}
    
    
    var garbageBagX5 = TrashMass * ratioX5
    garbageBagX5 = (garbageBagX5) * (1/5)
    garbageBagX5 = Float(Int(garbageBagX5))
    if (garbageBagX50 > 0) {garbageBags["garbageBagX5"] = garbageBagX5}
    
    
    var garbageBagX1 = TrashMass * ratioX1
    garbageBagX1 = Float(Int(garbageBagX1))
    if (garbageBagX50 > 0) {garbageBags["garbageBagX1"] = garbageBagX1}
    
    
    var canAndBag = TrashMass * ratioCanAndBag
    canAndBag = Float(Int(canAndBag))
    if (garbageBagX50 > 0) {garbageBags["canAndBag"] = canAndBag}
    
    
    
    
    
    
    return garbageBags
    
}

func garbageBagsInThePlane(TrashPlanes: [Float], timeLapse: String) -> [String: Float]{
    
    var garbageBags = [String:Float]()
    let higherTrash =  TrashPlanes.max()!
    var statusCode: String = timeLapse
    for TrashPlane in TrashPlanes{
        if (TrashPlane == higherTrash){
            
            switch statusCode {
            case "days":
                garbageBags = garbageRatio(TrashMass: TrashPlane , ratioX50: 0, ratioX10: 0, ratioX5: (3/4), ratioX1: (3/16), ratioCanAndBag: (1/16))
            case "month":
                garbageBags = garbageRatio(TrashMass: TrashPlane, ratioX50: (7/8), ratioX10: (3/32), ratioX5: (1/32), ratioX1: 0, ratioCanAndBag: 1/256)
            case "years":
                var TempTrashPlane = TrashPlane / 4
                garbageBags = garbageRatio(TrashMass: TempTrashPlane, ratioX50: 1, ratioX10: 0, ratioX5: 0, ratioX1: 0, ratioCanAndBag: 0)
            default:
                assert(true, "Missing Case")
            }
            
        }else{
            
            switch statusCode {
            case "days":
                garbageBags = garbageRatio(TrashMass: TrashPlane , ratioX50: 0, ratioX10: 0, ratioX5: (3/8), ratioX1: (3/8), ratioCanAndBag: 2/8)
            case "month":
                garbageBags = garbageRatio(TrashMass: TrashPlane, ratioX50: (10/16), ratioX10: (5/16), ratioX5: (3/64), ratioX1: (1/64), ratioCanAndBag: 0)
            case "years":
                var TempTrashPlane = TrashPlane / 4
                garbageBags = garbageRatio(TrashMass: TempTrashPlane, ratioX50: 7/8, ratioX10: 1/8, ratioX5: 0, ratioX1: 0, ratioCanAndBag: 0)
            default:
                assert(true, "Missing Case")
                
                
                
            }
        }
    }
    
    return garbageBags
}
