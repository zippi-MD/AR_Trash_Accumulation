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
    
    func lata() -> SCNNode {
        guard let pathScene = Bundle.main.path(forResource: "lataX", ofType: "scn", inDirectory: "art.scnassets/Models") else { return SCNNode() }
        let urlScene = URL(fileURLWithPath: pathScene)
        guard let scene = try? SCNScene(url: urlScene, options: nil) else { return SCNNode() }
        var node = SCNNode()
        for child in scene.rootNode.childNodes {
            if child.name == "lata" {
                node = child.clone()
            }
        }
        
        return node
    }
    
    func botella() -> SCNNode {
        guard let pathScene = Bundle.main.path(forResource: "botellaX", ofType: "scn", inDirectory: "art.scnassets/Models") else { return SCNNode() }
        let urlScene = URL(fileURLWithPath: pathScene)
        guard let scene = try? SCNScene(url: urlScene, options: nil) else { return SCNNode() }
        
        var node = SCNNode()
        for child in scene.rootNode.childNodes {
            if child.name == "botella" {
                node = child.clone()
            }
        }
        
        return node
    }
    
    func bolsa1K() -> SCNNode {
        guard let pathScene = Bundle.main.path(forResource: "bolsaX1K", ofType: "scn", inDirectory: "art.scnassets/Models") else { return SCNNode() }
        let urlScene = URL(fileURLWithPath: pathScene)
        guard let scene = try? SCNScene(url: urlScene, options: nil) else { return SCNNode() }
        
        var node = SCNNode()
        for child in scene.rootNode.childNodes {
            if child.name == "bolsaX1" {
                node = child.clone()
            }
        }
        
        return node
    }
    
    func bolsa2K() -> SCNNode {
        guard let pathScene = Bundle.main.path(forResource: "bolsaX2", ofType: "scn", inDirectory: "art.scnassets/Models") else { return SCNNode() }
        let urlScene = URL(fileURLWithPath: pathScene)
        guard let scene = try? SCNScene(url: urlScene, options: nil) else { return SCNNode() }
        
        var node = SCNNode()
        for child in scene.rootNode.childNodes {
            if child.name == "bolsaX2" {
                node = child.clone()
            }
        }
        
        return node
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
