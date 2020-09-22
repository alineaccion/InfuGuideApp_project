//
//  CatalogueCell.swift
//  InfuApp
//
//  Created by Alicia Moreno Alvarez on 15/09/2020.
//  Copyright © 2020 Alicia Moreno Alvarez. All rights reserved.
//

import UIKit

class CatalogueCell: UICollectionViewCell {
    
    @IBOutlet weak var collectionListImageView: UIImageView!
    @IBOutlet weak var symbolImage: UIImageView!
    @IBOutlet weak var collectionListTextView: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    static var cellCatalogueId = "CatalogueCell"
    
    override func prepareForReuse() {
        collectionListTextView.text = nil
        collectionListImageView.image = nil
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func configureCatalogueCell(image: String, symbol: String, text: String){
        self.collectionListTextView.text = text
        self.collectionListImageView.image = UIImage(named: image)
        self.symbolImage.image = UIImage(named: symbol)
    }
    
}
