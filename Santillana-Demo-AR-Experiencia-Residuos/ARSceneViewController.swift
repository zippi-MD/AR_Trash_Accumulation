//
//  ARSceneViewController.swift
//  Santillana-Demo-AR-Experiencia-Residuos
//
//  Created by Alejandro Mendoza on 6/10/19.
//  Copyright © 2019 Alejandro Mendoza. All rights reserved.
//

import UIKit
import ARKit

enum gameState {
    case detectingPlanes
}

class ARSceneViewController: UIViewController {
    
    //MARK: Detecting planes UI and variables
    @IBOutlet weak var detectingPlanesPanel: UIView!
    var debugPlanes = [SCNNode]()
    @IBOutlet weak var detectingPlanesLabel: UILabel!
    @IBOutlet weak var detectingPlanesButton: UIButton!
    
    //MARK: Outlets
    @IBOutlet weak var arSceneView: ARSCNView!
    
    //MARK: picker variables and data
    var pickerController: HorizontalPickerViewController!
    var pickerValues: [Any] = [1,2,3,4,5,6,7,8,9,10]
    var pickerSingularSuffix = "Día"
    var pickerPluralSuffix = "Días"
    
    //MARK: Control flow variables
    var actualState: gameState = .detectingPlanes
    
    //MARK: life cycle of view controller
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAR()
        setupPicker()
        detectingPlanesSetupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        pickerController.view.isHidden = true
        addChild(pickerController)
        view.addSubview(pickerController.view)
        pickerController.didMove(toParent: self)
    }
    //MARK: Actions
    @IBAction func stopTacking(_ sender: Any) {
        let config = ARWorldTrackingConfiguration()
        
        self.arSceneView.session.run(config)
    }
    
    //MARK: methods
    func setupPicker(){
        pickerController = HorizontalPickerViewController(values: pickerValues, singularSuffix: pickerSingularSuffix, pluralSuffix: pickerPluralSuffix)
    }
    
    private func setupAR(){
        arSceneView.delegate = self
        
        #if DEBUG
        arSceneView.debugOptions = [.showFeaturePoints]
        #endif
        
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = .horizontal
        
        arSceneView.session.run(config)
        
        let scene = SCNScene()
        
        arSceneView.scene = scene
    }
    
    private func detectingPlanesSetupUI(){
        self.detectingPlanesPanel.backgroundColor = .clear
        
        self.detectingPlanesLabel.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        self.detectingPlanesLabel.layer.cornerRadius = 100
        
        self.detectingPlanesButton.backgroundColor = UIColor.cyan.withAlphaComponent(0.1)
        self.detectingPlanesButton.isHidden = true
    }

}
