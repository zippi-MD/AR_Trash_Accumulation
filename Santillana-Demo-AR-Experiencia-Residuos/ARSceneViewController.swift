//
//  ARSceneViewController.swift
//  Santillana-Demo-AR-Experiencia-Residuos
//
//  Created by Alejandro Mendoza on 6/10/19.
//  Copyright © 2019 Alejandro Mendoza. All rights reserved.
//

import UIKit
import ARKit

class ARSceneViewController: UIViewController {
    
    //MARK: Constans
    let contants = ARSceneViewConstans.share

    
    //MARK: Outlets
    @IBOutlet weak var arSceneView: ARSCNView!
    
    //MARK: picker variables and data
    var pickerController: HorizontalPickerViewController!
    var pickerValues = [1,2,3,4,5,6,7,8,9,10]
    var pickerSingularSuffix = "Día"
    var pickerPluralSuffix = "Días"
    
    //MARK: Control flow variables
    var actualState: appState!{
        willSet {
            switch newValue {
            case .detectingPlanes?:
                self.detectingPlanesSetupUI()
            case .retriveInfo?:
                self.retriveInfoSetupUI()
            default:
                break
            }
        }
    }
    var debugPlanes = [SCNNode]()
    
    //MARK: life cycle of view controller
    override func viewDidLoad() {
        super.viewDidLoad()
        actualState = .detectingPlanes
        setupAR()
        setupPicker()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        pickerController.view.isHidden = true
        addChild(pickerController)
        view.addSubview(pickerController.view)
        pickerController.didMove(toParent: self)
    }
    //MARK: Actions
    
    @IBAction func stopPlaneDetection(_ sender: UIButton) {
        let config = ARWorldTrackingConfiguration()
        
        self.arSceneView.session.run(config)
        
        for child in debugPlanes{
            child.opacity = 0.0
        }
        self.actualState = .retriveInfo
        
    }
    
    //MARK: Preferences
    
    //MARK: methods
    func setupPicker(){
        pickerController = HorizontalPickerViewController(values: pickerValues, singularSuffix: pickerSingularSuffix, pluralSuffix: pickerPluralSuffix)
    }
    
    func setupAR(){
        actualState = .detectingPlanes
        
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
    
    //MARk: Observer methods for state of game
    func detectingPlanesSetupUI(){
        
    }
    
    func retriveInfoSetupUI(){
        
    }
}
