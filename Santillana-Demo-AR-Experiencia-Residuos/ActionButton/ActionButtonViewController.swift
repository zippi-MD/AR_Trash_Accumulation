//
//  ActionButtonViewController.swift
//  Santillana-Demo-AR-Experiencia-Residuos
//
//  Created by Alejandro Mendoza on 6/17/19.
//  Copyright © 2019 Alejandro Mendoza. All rights reserved.
//

import UIKit

class ActionButtonViewController: UIViewController {

    private var containerView: UIView!
    private var buttonLabel: UILabel!
    private let labelFont = UIFont(name: "PingFangTC-Semibold", size: 40)!
    
    var buttonText: String! {
        willSet {
            if let _ = buttonLabel {
                buttonLabel.text = newValue
            }
        }
    }
    
    init(text: String){
        buttonText = text
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = UIView(frame: CGRect(x: 0, y: 0, width: 250, height: 100))
        view.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        view.layer.cornerRadius = 10
        setupButtonLabel()
        setupContainerView()
        
    }
    
    private func setupContainerView(){
        containerView = UIView(frame: view.frame)
        containerView.layer.cornerRadius = 10
        
        let gradient = generateGradientLayer(colors: [UIColor.Santillana.deepBlue.cgColor, UIColor.Santillana.blue.cgColor], frame: containerView.frame)
        gradient.cornerRadius = 10
        containerView.layer.addSublayer(gradient)
        
        containerView.mask = buttonLabel
        
        self.view.addSubview(containerView)
    }
    
    private func setupButtonLabel(){
        buttonLabel = UILabel(frame: view.frame)
        
        buttonLabel.text = buttonText
        buttonLabel.textAlignment = .center
        buttonLabel.textColor = .white
        buttonLabel.font = labelFont
        buttonLabel.numberOfLines = 0
        
        self.view.addSubview(buttonLabel)
    }
    
    override func didMove(toParent parent: UIViewController?) {
        guard let parentView = parent!.view else {return}
        
        view.center = CGPoint(x: (parentView.frame.width - (view.frame.width/2) - 10), y: parentView.frame.height - (view.frame.height * 2))
    }
    
    
    

}
