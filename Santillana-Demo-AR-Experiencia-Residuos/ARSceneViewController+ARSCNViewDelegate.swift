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
        self.debugPlanes.append(node)
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
    
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        switch self.actualState {
        case .detectingPlanes?:
            detectingPlanes()
        default:
            break;
        }
    }
    //MARK: methods
    private func createPlaneNode(planeAnchor: ARPlaneAnchor) -> SCNNode?{
        guard let device = MTLCreateSystemDefaultDevice(), let geometryOfNode = ARSCNPlaneGeometry(device: device) else { return nil }
        geometryOfNode.update(from: planeAnchor.geometry)
        let node = SCNNode(geometry: geometryOfNode)
        //create a physics for the interaction with more nodes
        
        //let planeShape = SCNCylinder(radius: CGFloat(planeAnchor.extent.x), height: 0.0001)
        let planeShape = SCNCylinder(radius: CGFloat(higherBounding(node.boundingBox.max)), height: 0.0001)
        
        let boxBodyShape = SCNPhysicsShape(geometry: planeShape, options: nil)
        let physicsBody = SCNPhysicsBody(type: .static, shape: boxBodyShape)
        node.physicsBody = physicsBody
        //texture of the node for detected planes
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.green.withAlphaComponent(0.5)
        
        return node
    }
    
    private func detectingPlanes(){
        DispatchQueue.main.async {[unowned self] in
            for node in self.debugPlanes{
                let boundingBox = node.boundingBox.max
                if areaBounding(higherBounding(boundingBox)) > 1 && !self.showedAlertMessageForDetectingPlane {
                    self.showAlertMessage(message: self.contants.scanningAlertMessage)
                    self.showActionButtonWithMessage(self.contants.actionButtonForFinishedScanning)
                    self.showedAlertMessageForDetectingPlane = true
                }
            }
        }
    }
    
    
}
