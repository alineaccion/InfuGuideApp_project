//
//  CellMenu.swift
//  InfuApp
//
//  Created by Alicia Moreno Alvarez on 10/09/2020.
//  Copyright © 2020 Alicia Moreno Alvarez. All rights reserved.
//

import UIKit

class CellMenu: UITableViewCell {
    
    @IBOutlet weak var menuTypeImageView: UIImageView!
    @IBOutlet weak var menuTypeTextView: UILabel!

static var cellMenuId = "CellMenu"
    
    
    override func prepareForReuse() {
        menuTypeImageView.image = nil
        menuTypeTextView.text = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    func configureCell(image: String, text: String){
        self.menuTypeTextView.text = text
        self.menuTypeImageView.image = UIImage(named: image)
    }
}
