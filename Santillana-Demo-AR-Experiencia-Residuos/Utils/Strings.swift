//
//  Strings.swift
//  Santillana-Demo-AR-Experiencia-Residuos
//
//  Created by Alejandro Mendoza on 6/13/19.
//  Copyright © 2019 Alejandro Mendoza. All rights reserved.
//

import UIKit

extension String {
    func withWithGivenHeight(_ height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: CGFloat.greatestFiniteMagnitude, height: height)
        
        let boundingBox = self.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.width)
        
    }
}
