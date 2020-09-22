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
    @IBOutlet weak var tagSymbolHomeMenu: UIImageView!
    static var cellHomeMenuId = "CellHomeMenu"
    
    override func prepareForReuse() {
        homeMenuImageView.image = nil
        homeMenuTextView.text = nil
        tagSymbolHomeMenu.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(image: String, text: String, imageSymbol: String){
        self.homeMenuTextView.text = text
        self.homeMenuImageView.image = UIImage(named: image)
        self.tagSymbolHomeMenu.image = UIImage(named: imageSymbol)
        
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.clear
        selectedBackgroundView = bgColorView
    }
}
