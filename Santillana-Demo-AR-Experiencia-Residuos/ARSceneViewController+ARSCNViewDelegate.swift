//
//  ARSceneViewController+ARSCNViewDelegate.swift
//  Santillana-Demo-AR-Experiencia-Residuos
//
//  Created by Carlos Daniel Hernandez Chauteco on 6/11/19.
//  Copyright © 2019 Alejandro Mendoza. All rights reserved.
//

import ARKit
import SceneKit

extension ARSceneViewController: ARSCNViewDelegate{
    //MARK: Delegates
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard let planeAnchor = anchor as? ARPlaneAnchor, let planeNode = createPlaneNode(planeAnchor: planeAnchor) else { return }
        node.addChildNode(planeNode)
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let planeAnchor = anchor as? ARPlaneAnchor, let planeNode = createPlaneNode(planeAnchor: planeAnchor) else { return } //craete a merge geometry
        for child in node.childNodes{
            child.removeFromParentNode()
        }
        node.addChildNode(planeNode)
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didRemove node: SCNNode, for anchor: ARAnchor) {
        for child in node.childNodes{
            child.removeFromParentNode()
        }
    }
    //MARK: functions
    private func createPlaneNode(planeAnchor: ARPlaneAnchor) -> SCNNode?{
        guard let device = MTLCreateSystemDefaultDevice(), let geometryOfNode = ARSCNPlaneGeometry(device: device) else { return nil }
        geometryOfNode.update(from: planeAnchor.geometry)
        let node = SCNNode(geometry: geometryOfNode)
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.green.withAlphaComponent(0.5)
        
        return node
    }
}
