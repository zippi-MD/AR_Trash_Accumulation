//
//  TrashInformation.swift
//  Santillana-Demo-AR-Experiencia-Residuos
//
//  Created by Carlos Daniel Hernandez Chauteco on 6/14/19.
//  Copyright © 2019 Alejandro Mendoza. All rights reserved.
//

import Foundation

struct TimeInformation {
    var timeSelected: Int
    
    var timeLapse: Time {
        didSet{
            changeTimeInDays()
        }
    }
    
    var timeInDays: Int = 0
    
    private mutating func changeTimeInDays(){
        timeInDays = timeSelected * timeLapse.hashValue
    }
    
    init(timeSelected: Int, timeLapse: Time) {
        self.timeSelected = timeSelected
        self.timeLapse = timeLapse
    }
}
