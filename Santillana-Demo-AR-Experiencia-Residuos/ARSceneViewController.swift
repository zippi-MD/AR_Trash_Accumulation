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
    
    //MARK: Control flow variables
    var actualState: AppState!{
        willSet {
            switch newValue {
            case .detectingPlanes?:
                self.detectingPlanesSetupUI()
            case .retriveInfo?:
                self.retriveInfoSetupUI()
            case .displayTrash?:
                self.displayTrashSetupUI()
            default:
                break
            }
        }
    }
    
    var debugPlanes = [SCNNode]()
    var timeInformation: TimeInformation?
    var trashInformation: TrashInformation?
    
    //MARK: life cycle of view controller
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAR()
        setupPicker()
        actualState = .detectingPlanes
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        addChild(pickerController)
        view.addSubview(pickerController.view)
        pickerController.didMove(toParent: self)
        
        pickerController.view.isHidden = true
    }
    //MARK: Actions
    
    func setTrashInformation(){
        //logic to get the total trash
        actualState = .displayTrash
    }
    
    func stopPlaneDetection() {
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
        pickerController = HorizontalPickerViewController(values: pickerValues, unit: .kilo)
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
    
    func displayTrashSetupUI(){
        
    }
}
