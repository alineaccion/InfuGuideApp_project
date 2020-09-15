//
//  DataDetail.swift
//  InfuApp
//
//  Created by Alicia Moreno Alvarez on 15/09/2020.
//  Copyright © 2020 Alicia Moreno Alvarez. All rights reserved.
//

import Foundation

class DataDetail: NSObject {
    let title: String
    let temperature: String
    let time: String
    let infudescription: String
    let properties: String
    
    init(title: String, temperature: String, time: String, infudescription: String, properties: String) {
        self.title = title
        self.temperature = temperature
        self.time = time
        self.infudescription = infudescription
        self.properties = properties
    }
    
}
