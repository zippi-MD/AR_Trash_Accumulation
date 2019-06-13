//
//  ARSceneViewController.swift
//  Santillana-Demo-AR-Experiencia-Residuos
//
//  Created by Alejandro Mendoza on 6/10/19.
//  Copyright © 2019 Alejandro Mendoza. All rights reserved.
//

import UIKit
import ARKit

enum appState {
    case detectingPlanes
    case retriveInfo
}

class ARSceneViewController: UIViewController {
    
    //MARK: Constans
    let contants = ARSceneViewConstans.share
    //MARK: Detecting planes UI and variables
    @IBOutlet weak var detectingPlanesPanel: UIView!
    var debugPlanes = [SCNNode]()
    @IBOutlet weak var detectingPlanesLabel: UILabel!
    @IBOutlet weak var detectingPlanesButton: UIButton!
    @IBOutlet weak var detectingPlaneNoteLabel: UILabel!
    
    //MARK: Outlets
    @IBOutlet weak var arSceneView: ARSCNView!
    
    //MARK: picker variables and data
    var pickerController: HorizontalPickerViewController!
    var pickerValues: [Any] = [1,2,3,4,5,6,7,8,9,10]
    var pickerSingularSuffix = "Día"
    var pickerPluralSuffix = "Días"
    
    //MARK: Control flow variables
    var actualState: appState!{
        willSet(newValue){
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
        
        for child in debugPlanes{ //clear the debug planes
            child.opacity = 0.0
        }
        
        UIView.transition(with: detectingPlanesLabel, duration: TimeInterval(3), options: .transitionCrossDissolve, animations: {[unowned self] in
            self.detectingPlanesLabel.text = self.contants.labelPlaneDetectionSecondMessage
        }, completion: {[unowned self] (_) in
            self.actualState = .retriveInfo
        }) // change the text with transicion
        
    }
    
    //MARK: Preferences
    
    //MARK: methods
    func setupPicker(){
        pickerController = HorizontalPickerViewController(values: pickerValues, singularSuffix: pickerSingularSuffix, pluralSuffix: pickerPluralSuffix)
    }
    
    private func setupAR(){
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
    private func detectingPlanesSetupUI(){
        self.detectingPlanesPanel.backgroundColor = .clear
        
        self.detectingPlanesLabel.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        self.detectingPlanesLabel.layer.cornerRadius = 10
        self.detectingPlanesLabel.text = contants.labelPlaneDetectionFirstMessage
        
        self.detectingPlaneNoteLabel.text = contants.labelPlaneDetectionNoteMessage
        self.detectingPlaneNoteLabel.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        self.detectingPlaneNoteLabel.isHidden = true
        
        self.detectingPlanesButton.backgroundColor = UIColor.cyan.withAlphaComponent(0.1)
        self.detectingPlanesButton.layer.cornerRadius = 10
        self.detectingPlanesButton.isHidden = true
        
        //hiden the other panels
    }
    
    private func retriveInfoSetupUI(){
        
        //hiden the other panels
        self.detectingPlanesPanel.isHidden = true
    }
}
