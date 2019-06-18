//
//  HorizontalPickerDelegate.swift
//  Santillana-Demo-AR-Experiencia-Residuos
//
//  Created by Alejandro Mendoza on 6/12/19.
//  Copyright © 2019 Alejandro Mendoza. All rights reserved.
//

import Foundation

protocol HorizontalPickerDelegate {
    func pickerDidChangedValueTo(_ value: Int, withUnit unit: Mass)
    func pickerDidChangedValueTo(_ value: Int, withUnit unit: Time)
}
