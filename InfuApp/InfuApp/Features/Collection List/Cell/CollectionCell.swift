//
//  CollectionCell.swift
//  InfuApp
//
//  Created by Alicia Moreno Alvarez on 15/09/2020.
//  Copyright © 2020 Alicia Moreno Alvarez. All rights reserved.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var collectionListImageView: UIImageView!
       @IBOutlet weak var collectionListTextView: UILabel!
    
    static var cellCollectionId = "CollectionCell"
    
    override func prepareForReuse() {
        collectionListTextView.text = nil
        collectionListImageView.image = nil
        
    }
    override func awakeFromNib() {
           super.awakeFromNib()
       }
    func configureCollectionCell(image: String, text: String){
        self.collectionListTextView.text = text
        self.collectionListImageView.image = UIImage(named: image)
    }
    

    
}
