//
//  ARSceneViewController+HorizontalPickerDelegate.swift
//  Santillana-Demo-AR-Experiencia-Residuos
//
//  Created by Alejandro Mendoza on 6/17/19.
//  Copyright © 2019 Alejandro Mendoza. All rights reserved.
//

import Foundation

extension ARSceneViewController: HorizontalPickerDelegate {
    func pickerDidChangedValueTo(_ value: Int, withUnit unit: Mass) {
        trash = TrashInformation(quantity: value, unit: unit)
    }
    
    func pickerDidChangedValueTo(_ value: Int, withUnit unit: Time) {
        timeSelected.timeSelected = value
        timeSelected.timeLapse = unit
    }
    
    
}
