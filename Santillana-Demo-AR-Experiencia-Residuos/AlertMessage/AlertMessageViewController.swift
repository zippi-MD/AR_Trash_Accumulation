//
//  AlertMessageViewController.swift
//  Santillana-Demo-AR-Experiencia-Residuos
//
//  Created by Alejandro Mendoza on 6/14/19.
//  Copyright © 2019 Alejandro Mendoza. All rights reserved.
//

import UIKit

class AlertMessageViewController: UIViewController {

    var message: String! {
        willSet {
            if let label = messageLabel {
                label.text = newValue
            }
        }
    }
    
    private var messageLabel: UILabel!
    private let labelWidth: CGFloat!
    private let viewHeight: CGFloat = 50
    private let labelFont = UIFont(name: "PingFangTC-Semibold", size: 20)!
    private let labelColor = UIColor.white
    
    init(message: String){
        self.message = message
        labelWidth = self.message.withWithGivenHeight(viewHeight, font: labelFont)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = UIView(frame: CGRect(x: 0, y: 0, width: labelWidth + 50, height: viewHeight))
        setupContainerView()
        setupLabel()
    }
    
    func setupContainerView() {
        view.backgroundColor = .black
        view.alpha = 0.7
        view.layer.cornerRadius = 10
    }
    
    private func setupLabel(){
        messageLabel = UILabel(frame: view.frame)
        messageLabel.text = message
        messageLabel.font = labelFont
        messageLabel.textAlignment = .center
        messageLabel.textColor = labelColor
        messageLabel.numberOfLines = 0
        
        view.addSubview(messageLabel)
    }
    
    override func didMove(toParent parent: UIViewController?) {
        guard let parentView = parent?.view else {return}
        
        view.center = CGPoint(x: (view.frame.width / 2) + 20, y: parentView.frame.height - viewHeight)
        
    }

}
