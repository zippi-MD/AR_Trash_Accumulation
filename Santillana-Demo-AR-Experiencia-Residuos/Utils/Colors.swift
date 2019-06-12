//
//  Colors.swift
//  Santillana-Demo-AR-Experiencia-Residuos
//
//  Created by Alejandro Mendoza on 6/12/19.
//  Copyright © 2019 Alejandro Mendoza. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
    
    struct Santillana {
        
        static var green = UIColor(red: 46, green: 204, blue: 113)
        static var red = UIColor(red: 231, green: 76, blue: 60)
        static var blue = UIColor(red: 52, green: 152, blue: 219)
        static var purple = UIColor(red: 155, green: 89, blue: 182)
        static var yellow = UIColor(red: 241, green: 196, blue: 15)
        static var orange = UIColor(red: 230, green: 126, blue: 34)
        static var deepBlue = UIColor(red: 52, green: 73, blue: 94)
        
        static var colors = [green, red, blue, purple, yellow, orange, deepBlue]
        
        
    }
}
