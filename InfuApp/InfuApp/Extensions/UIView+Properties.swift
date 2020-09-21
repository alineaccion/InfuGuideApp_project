//
//  UIView+Properties.swift
//  InfuApp
//
//  Created by Alicia Moreno Alvarez  on 20/09/2020.
//  Copyright © 2020 Alicia Moreno Alvarez. All rights reserved.
//
import UIKit
// Para modificar vistas en storyboard sin codigo añadiendo las opciones para personalizar el diseño de la pantalla
//https://stackoverflow.com/questions/54999229/cornerradius-and-shadow-on-a-uiview-using-ibinspectable-swift-4-2

extension UIView {

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}
