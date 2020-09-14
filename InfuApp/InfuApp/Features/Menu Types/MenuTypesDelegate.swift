//
//  MenuTypesDelegate.swift
//  InfuApp
//
//  Created by Alicia Moreno Alvarez on 10/09/2020.
//  Copyright © 2020 Alicia Moreno Alvarez. All rights reserved.
//

import Foundation

protocol MenuTypesDelegate: AnyObject {
    func navigate(to indentifier: String, data: Any?)
}
