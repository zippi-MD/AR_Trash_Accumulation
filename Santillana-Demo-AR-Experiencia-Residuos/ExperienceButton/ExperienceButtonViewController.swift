//
//  ExperienceButtonViewController.swift
//  Santillana-Demo-AR-Experiencia-Residuos
//
//  Created by Alejandro Mendoza on 6/13/19.
//  Copyright © 2019 Alejandro Mendoza. All rights reserved.
//

import UIKit

class ExperienceButtonViewController: UIViewController {
    
    private var titleLabel: UILabel!
    private let titleLabelText: String!
    private var experienceImageView: UIImageView!
    private var experienceImage: UIImage!
    private var unavailableImageView: UIImageView!
    
    private let viewWidth = 300
    private let viewHeight = 300
    
    private let font = UIFont(name: "PingFangTC-Semibold", size: 30)
    
    let isAvailable: Bool!
    
    init(title: String, image: UIImage, available: Bool = true){
        titleLabelText = title
        experienceImage = image
        isAvailable = available
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = UIView(frame: CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight))
        
        setupExperienceView()
        setupTitleLabel()
        
        if !isAvailable {
            setupUnavailableImage()
        }
        
    }
    
    func setupExperienceView(){
        
        experienceImageView = UIImageView(frame: CGRect(x: 0, y: 20, width: viewWidth, height: (viewWidth/3)*2))
        experienceImageView.contentMode = .scaleAspectFit
        experienceImageView.image = experienceImage
        
        view.addSubview(experienceImageView)
        
    }
    
    func setupTitleLabel(){
        
        titleLabel = UILabel(frame: CGRect(x: 0, y: (viewHeight/3)*2, width: viewWidth, height: viewHeight/3))
        titleLabel.textAlignment = .center
        titleLabel.font = font
        titleLabel.text = titleLabelText
        
        view.addSubview(titleLabel)
        
    }
    
    private func setupUnavailableImage(){
        let unavailableImagePadding = 10
        unavailableImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: viewWidth - unavailableImagePadding, height: viewHeight - unavailableImagePadding))
        unavailableImageView.alpha = 0.5
        unavailableImageView.contentMode = .scaleAspectFit
        unavailableImageView.center = view.center
        let unavailableImage = UIImage(named: "unavailable-circle")
        unavailableImageView.image = unavailableImage
        
        view.addSubview(unavailableImageView)
        
    }

}
