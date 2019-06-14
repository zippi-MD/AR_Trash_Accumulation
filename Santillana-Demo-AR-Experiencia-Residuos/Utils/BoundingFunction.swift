//
//  BoundingFunction.swift
//  Santillana-Demo-AR-Experiencia-Residuos
//
//  Created by Eduardo Quintero on 6/14/19.
//  Copyright © 2019 Alejandro Mendoza. All rights reserved.
//
import  UIKit
import ARKit
import  SceneKit

func higherBounding(_ bounds: SCNVector3) -> Float {
    var higher : Float = 0
    if(bounds.x < bounds.z){
        
       higher = bounds.z
        
    }else{
       higher = bounds.x
    }
    return higher
    
}


func AreaBounding(_ radius: Float ) -> Float{

    return 3.1416 * (radius * radius)
}
