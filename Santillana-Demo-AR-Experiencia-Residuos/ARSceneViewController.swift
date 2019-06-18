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
    
    var message: MessageLabelViewController!
    var alert: AlertMessageViewController!
    var actionButton: ActionButtonViewController!
    
    //MARK: Detecting Plane Variable
    var showedAlertMessageForDetectingPlane = false
    
    //MARK: Retrieving Information
    var trash: TrashInformation!
    
    //MARK: Showing Trash
    var timeSelected: TimeInformation!
    
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
        setupUIElements()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addUIElementsToView()
        actualState = .detectingPlanes
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
    
    func setupUIElements(){
        setupMassPicker()
        setupMessage()
        setupActionButton()
    }
    
    func addUIElementsToView(){
        addChild(pickerController)
        view.addSubview(pickerController.view)
        pickerController.didMove(toParent: self)
        pickerController.view.isHidden = true
        
        addChild(message)
        view.addSubview(message.view)
        message.didMove(toParent: self)
        message.view.isHidden = true
        
        addChild(actionButton)
        view.addSubview(actionButton.view)
        actionButton.didMove(toParent: self)
        actionButton.view.isHidden = true
    }
    
    func setupMassPicker(){
        let pickerUnit = Mass.kilo
        trash = TrashInformation(quantity: 0, unit: pickerUnit)
        pickerController = HorizontalPickerViewController(values: pickerMassValues[pickerUnit]!, unit: pickerUnit)
        pickerController.delegate = self
    }
    
    func setupTimePicker(){
        let pickerUnit = Time.day
        timeSelected = TimeInformation(timeSelected: 1, timeLapse: pickerUnit)
        pickerController = HorizontalPickerViewController(values: pickerTimeValues[pickerUnit]!, unit: pickerUnit)
    }
    
    func addTimerPickerToView(){
        addChild(pickerController)
        view.addSubview(pickerController.view)
        pickerController.didMove(toParent: self)
    }
    
    func setupMessage(){
        message = MessageLabelViewController(message: " ")
    }
    
    func showAlertMessage(message: String){
        alert = AlertMessageViewController(message: message)
        addChild(alert)
        view.addSubview(alert.view)
        alert.didMove(toParent: self)
    }
    
    func setupActionButton(){
        actionButton = ActionButtonViewController(text: " ")
        let tap = UITapGestureRecognizer(target: self, action: #selector(actionButtonWasPressed))
        actionButton.view.addGestureRecognizer(tap)
    }
    
    func showActionButtonWithMessage(_ message: String){
        actionButton.buttonText = message
        actionButton.view.isHidden = false
    }
    
    func setupAR(){
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
        message.message = contants.startScanningMessage
        message.view.isHidden = false
    }
    
    func retriveInfoSetupUI(){
        actionButton.view.isHidden = true
        alert.view.isHidden = true
        
        message.message = contants.retrieveInformationAskTrashData
        pickerController.view.isHidden = false
        
        actionButton.buttonText = contants.endRetrievingInformation
        actionButton.view.isHidden = false
        
    }
    
    func displayTrashSetupUI(){
        actionButton.view.isHidden = true
        alert.view.isHidden = false
        
        
    }
    
    
    @objc func actionButtonWasPressed(){
        guard let state = actualState else { return }
        switch state {
        case .detectingPlanes:
            stopPlaneDetection()
            actualState = .retriveInfo
            
        case .retriveInfo:
            pickerController.view.isHidden = true
            setupTimePicker()
            addTimerPickerToView()
            actualState = .displayTrash
            
        default:
            assert(true, "Missing Case")
            
        }
    }
}
