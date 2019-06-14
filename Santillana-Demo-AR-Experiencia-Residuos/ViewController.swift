//
//  ViewController.swift
//  Santillana-Demo-AR-Experiencia-Residuos
//
//  Created by Alejandro Mendoza on 6/10/19.
//  Copyright © 2019 Alejandro Mendoza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var selectableOptions: [UIView]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupOptions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }
    
    
    func setupOptions(){
        let primariaOption = GradientLabelViewCotroller(text: "Primaria", gradientColors: [UIColor.Santillana.red.cgColor, UIColor.Santillana.orange.cgColor])
        addChild(primariaOption)
        
        let secundariaOption = GradientLabelViewCotroller(text: "Secundaria", gradientColors: [UIColor.Santillana.purple.cgColor, UIColor.Santillana.blue.cgColor])
        addChild(secundariaOption)

        let bachilleratoOption = GradientLabelViewCotroller(text: "Bachillerato", gradientColors: [UIColor.Santillana.green.cgColor, UIColor.Santillana.blue.cgColor])
        addChild(bachilleratoOption)

        selectableOptions = [primariaOption.view, secundariaOption.view, bachilleratoOption.view]   
    }
    
    func setupUI(){
        
        for option in selectableOptions! {
            view.addSubview(option)
        }
        
        let bottomHeightConstant = -selectableOptions!.first!.frame.height * 2
        
        let middleOption = selectableOptions![1]
        middleOption.translatesAutoresizingMaskIntoConstraints = false

        middleOption.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -middleOption.frame.width / 2).isActive = true
        middleOption.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: bottomHeightConstant).isActive = true
        
        let leftOption = selectableOptions![0]
        leftOption.translatesAutoresizingMaskIntoConstraints = false
        
        leftOption.rightAnchor.constraint(equalTo: middleOption.leftAnchor, constant: -(leftOption.frame.width + 100)).isActive = true
        leftOption.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: bottomHeightConstant).isActive = true
        
        let rightOption = selectableOptions![2]
        rightOption.translatesAutoresizingMaskIntoConstraints = false
        
        rightOption.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: bottomHeightConstant).isActive = true
        rightOption.leftAnchor.constraint(equalTo: middleOption.rightAnchor, constant: (rightOption.frame.width + 50)).isActive = true
        
        
        
        
    }
    

    
    
}

