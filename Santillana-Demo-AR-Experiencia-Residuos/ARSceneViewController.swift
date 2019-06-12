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

    @IBOutlet weak var arSceneView: ARSCNView!
    
    var pickerController: HorizontalPickerViewController!
    var pickerValues: [Any] = [1,2,3,4,5,6,7,8,9,10]
    var pickerSingularSuffix = "Día"
    var pickerPluralSuffix = "Días"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arSceneView.delegate = self
        
        #if DEBUG
        arSceneView.debugOptions = [.showFeaturePoints]
        #endif
        
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = .horizontal
        
        arSceneView.session.run(config)
        
        let scene = SCNScene()
        
        arSceneView.scene = scene
        
        setupPicker()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        addChild(pickerController)
        view.addSubview(pickerController.view)
        pickerController.didMove(toParent: self)
    }
    
    func setupPicker(){
        pickerController = HorizontalPickerViewController(values: pickerValues, singularSuffix: pickerSingularSuffix, pluralSuffix: pickerPluralSuffix)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
