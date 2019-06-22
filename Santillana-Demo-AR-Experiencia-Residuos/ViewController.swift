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
        title = "Selecciona tu grado"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }
    
    
    func setupOptions(){
        let primariaOption = GradientLabelViewCotroller(text: "Primaria", gradientColors: [UIColor.Santillana.red.cgColor, UIColor.Santillana.orange.cgColor])
        primariaOption.view.tag = 0
        addChild(primariaOption)
        
        let secundariaOption = GradientLabelViewCotroller(text: "Secundaria", gradientColors: [UIColor.Santillana.purple.cgColor, UIColor.Santillana.blue.cgColor])
        secundariaOption.view.tag = 1
        addChild(secundariaOption)

        let bachilleratoOption = GradientLabelViewCotroller(text: "Bachillerato", gradientColors: [UIColor.Santillana.green.cgColor, UIColor.Santillana.blue.cgColor])
        bachilleratoOption.view.tag = 2
        addChild(bachilleratoOption)

        selectableOptions = [primariaOption.view, secundariaOption.view, bachilleratoOption.view]   
    }
    
    func setupUI(){
        
        let labelsYCoordinate = view.center.y
        let sidePadding: CGFloat = 50
        
        let tapSecundaria = UITapGestureRecognizer(target: self, action: #selector(test(_:)))
        tapSecundaria.name = "secundaria"
        
        let middleOption = selectableOptions![1]
        middleOption.addGestureRecognizer(tapSecundaria)
        
        view.addSubview(middleOption)
        
        middleOption.center = CGPoint(x: view.center.x, y: labelsYCoordinate)
        
        
        let tapPrimaria = UITapGestureRecognizer(target: self, action: #selector(test(_:)))
        tapPrimaria.name = "primaria"
        
        let leftOption = selectableOptions![0]
        leftOption.addGestureRecognizer(tapPrimaria)
        
        view.addSubview(leftOption)
        
        let leftOptionXCoordinate =  leftOption.frame.width/2 + sidePadding
        
        leftOption.center = CGPoint(x: leftOptionXCoordinate, y: labelsYCoordinate)
        
        let tapBachillerato = UITapGestureRecognizer(target: self, action: #selector(test(_:)))
        tapBachillerato.name = "bachillerato"
        
        let rightOption = selectableOptions![2]
        rightOption.addGestureRecognizer(tapBachillerato)
        
        view.addSubview(rightOption)
        
        let rightOptionXCoordinate = view.frame.width - rightOption.frame.width/2 - 30
        
        rightOption.center = CGPoint(x: rightOptionXCoordinate, y: labelsYCoordinate)
        
    }
    
    
    @objc func test(_ sender: UITapGestureRecognizer){
        guard let name = sender.name else {return}
        
        if name == "primaria" {
            let experienceVC = ExperiencesViewController()
            navigationController?.pushViewController(experienceVC, animated: true)
        }
    }
    
    
}

