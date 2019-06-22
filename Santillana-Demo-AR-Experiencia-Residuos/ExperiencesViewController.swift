//
//  ExperiencesViewController.swift
//  Santillana-Demo-AR-Experiencia-Residuos
//
//  Created by Alejandro Mendoza on 6/21/19.
//  Copyright © 2019 Alejandro Mendoza. All rights reserved.
//

import UIKit

class ExperiencesViewController: UIViewController {
    
    var selectableOptions: [UIView]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Selecciona una experiencia"
        generateOptions()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupUI()
    }
    
    func generateOptions(){
        let mapExperience = ExperienceButtonViewController(title: "Mapa Interactivo", image: UIImage(named: "world")!, available: false)
        addChild(mapExperience)
        
        let trashExperience = ExperienceButtonViewController(title: "Basura Generada", image: UIImage(named: "trash")!, available: true)
        addChild(trashExperience)
        
        let zooExperience = ExperienceButtonViewController(title: "Zoológico", image: UIImage(named: "zoo")!, available: false)
        addChild(zooExperience)
        
        selectableOptions = [mapExperience.view, trashExperience.view, zooExperience.view]
    }
    
    func setupUI(){
        
        let leftOption = selectableOptions![0]
        
        let mapTap = UITapGestureRecognizer(target: self, action: #selector(didSelectExperience(_:)))
        mapTap.name = "map"
        leftOption.addGestureRecognizer(mapTap)
        
        view.addSubview(leftOption)
        
        leftOption.center = CGPoint(x: leftOption.frame.width/2 + 20, y: view.center.y)
        
        
        let centerOption = selectableOptions![1]
        
        let trashTap = UITapGestureRecognizer(target: self, action: #selector(didSelectExperience(_:)))
        trashTap.name = "trash"
        centerOption.addGestureRecognizer(trashTap)
        
        view.addSubview(centerOption)
        
        centerOption.center = view.center
        
        
        let rightOption = selectableOptions![2]
        
        let zooTap = UITapGestureRecognizer(target: self, action: #selector(didSelectExperience(_:)))
        zooTap.name = "zoo"
        rightOption.addGestureRecognizer(zooTap)
        
        view.addSubview(rightOption)
        
        rightOption.center = CGPoint(x: view.frame.width - rightOption.frame.width/2 - 20, y: view.center.y)
        
        
    }
    
    
    @objc func didSelectExperience(_ sender: UITapGestureRecognizer){
        guard let name = sender.name else { return }
        
        if name == "trash"{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "ARTrashExperience") as! ARSceneViewController
            present(controller, animated: true)
        }
    }

}
