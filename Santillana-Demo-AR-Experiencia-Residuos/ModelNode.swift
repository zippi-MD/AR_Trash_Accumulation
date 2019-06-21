//
//  ModelNode.swift
//  Santillana-Demo-AR-Experiencia-Residuos
//
//  Created by Carlos Daniel Hernandez Chauteco on 6/20/19.
//  Copyright © 2019 Alejandro Mendoza. All rights reserved.
//
import SceneKit

class ModelNode{
    static let share = ModelNode()
    
    func getModelNodeFor(_ trashModel: TrashModels) -> SCNNode?{
        guard let pathScene = Bundle.main.path(forResource: trashModel.rawValue, ofType: "scn", inDirectory: "art.scnassets/Models") else { return nil }
        let urlScene = URL(fileURLWithPath: pathScene)
        guard let scene = try? SCNScene(url: urlScene, options: nil) else { return nil }
        
        for child in scene.rootNode.childNodes {
            if child.name == trashModel.rawValue {
                return child.clone()
            }
        }
        
        return nil
    }
    
    
    func tvNode() -> SCNNode {
        guard let pathScene = Bundle.main.path(forResource: "telepantalla", ofType: "scn", inDirectory: "art.scnassets/Models") else { return SCNNode() }
        let urlScene = URL(fileURLWithPath: pathScene)
        guard let scene = try? SCNScene(url: urlScene, options: nil) else { return SCNNode() }
        
        var node = SCNNode()
        
        for child in scene.rootNode.childNodes {
            if child.name == "Tele" {
                node = child.clone()
            }
        }
        
        return node
    }
}
