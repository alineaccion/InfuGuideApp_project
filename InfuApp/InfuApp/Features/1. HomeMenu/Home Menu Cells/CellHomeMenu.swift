//
//  CellMenu.swift
//  InfuApp
//
//  Created by Alicia Moreno Alvarez on 10/09/2020.
//  Copyright © 2020 Alicia Moreno Alvarez. All rights reserved.
//

import UIKit

class CellHomeMenu: UITableViewCell {
    
    @IBOutlet weak var homeMenuImageView: UIImageView!
    @IBOutlet weak var homeMenuTextView: UILabel!

static var cellHomeMenuId = "CellHomeMenu"
    
    
    override func prepareForReuse() {
        homeMenuImageView.image = nil
        homeMenuTextView.text = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(image: String, text: String){
        self.homeMenuTextView.text = text
        self.homeMenuImageView.image = UIImage(named: image)
    }
}
