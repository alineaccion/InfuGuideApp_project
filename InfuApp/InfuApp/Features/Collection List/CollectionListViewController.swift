
//
//  CollectionListViewController.swift
//  InfuApp
//
//  Created by Alicia Moreno Alvarez on 14/09/2020.
//  Copyright © 2020 Alicia Moreno Alvarez. All rights reserved.
//

import UIKit
import RxSwift

class CollectionListViewController: UIViewController {
    
    static var storyboardId = "CollectionListViewController"
    static var storyboardName = "Collection"
    let viewModel = CollectionListViewModel()
    private let disposeBag = DisposeBag()
    var listCollection: [DataCollectionList]?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
           super.viewDidLoad()
    }
    
    func configureViews() {
        collectionView.register(UINib(nibName: CollectionCell.cellCollectionId, bundle: nil), forCellWithReuseIdentifier: CollectionCell.cellCollectionId)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension CollectionListViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    

}
