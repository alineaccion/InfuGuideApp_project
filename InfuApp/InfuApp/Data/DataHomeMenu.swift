//
//  DataMenuType.swift
//  InfuApp
//
//  Created by Alicia Moreno Alvarez on 10/09/2020.
//  Copyright © 2020 Alicia Moreno Alvarez. All rights reserved.
//

import Foundation

class DataHomeMenu: NSObject {
    let title: String
    let image: String
    let infutype: InfuType
    
    init (title: String, image: String, infutype: InfuType) {
        self.title = title
        self.image = image
        self.infutype = infutype
    }
}
