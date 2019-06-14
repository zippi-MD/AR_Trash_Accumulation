//
//  GradientButtonsViewController.swift
//  Santillana-Demo-AR-Experiencia-Residuos
//
//  Created by Alejandro Mendoza on 6/13/19.
//  Copyright © 2019 Alejandro Mendoza. All rights reserved.
//

import UIKit

class GradientLabelViewCotroller: UIViewController {
    
    private let labelHeight: CGFloat = 70
    private let labelWidth: CGFloat!
    
    private let labelFont = UIFont(name: "PingFangTC-Semibold", size: 50)!
    
    private let labelText: String!
    
    private var gradientLabel: UILabel!
    
    private let gradientColors: [CGColor]!
    
    private let gradientOrientation: Orientations!
    
    init(text: String, gradientColors: [CGColor], gradientOrientation orientation: Orientations = .horizontal){
        gradientOrientation = orientation
        self.gradientColors = gradientColors
        
        labelText = text
        labelWidth = labelText.withWithGivenHeight(labelHeight, font: labelFont)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        view = UIView(frame: CGRect(x: 0, y: 0, width: labelWidth, height: labelHeight))
        view.backgroundColor = .red
        applyGradient()
        setupLabel()
        applyMask()
    }
    
    private func applyGradient(){
        let gradient: CAGradientLayer
        
        switch gradientOrientation! {
        case .horizontal:
            gradient = generateGradientLayer(colors: gradientColors, frame: view.frame, startPoint: CGPoint(x: 0, y: 0.5), endPoint: CGPoint(x: 1, y: 0.5))
        case .vertical:
            gradient = generateGradientLayer(colors: gradientColors, frame: view.frame)
        }
        
        view.layer.addSublayer(gradient)
    }
    
    private func setupLabel(){
        gradientLabel = UILabel(frame: CGRect(x: 0, y: 0, width: labelWidth, height: labelHeight))
        gradientLabel.text = labelText
        gradientLabel.font = labelFont
        
        view.addSubview(gradientLabel)
    }
    
    private func applyMask(){
        view.mask = gradientLabel
    }
    
    
}
