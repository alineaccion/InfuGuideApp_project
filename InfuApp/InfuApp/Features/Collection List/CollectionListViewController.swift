
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
    
    var infuType: InfuType?
    static var storyboardId = "CollectionListViewController"
    static var storyboardName = "Collection"
    private let viewModel = CollectionListViewModel()
    private let disposeBag = DisposeBag()
    var listCollection: [DataCollectionList]?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
           super.viewDidLoad()
    }
    func configureViews() {
        collectionView.register(<#T##cellClass: AnyClass?##AnyClass?#>, forCellWithReuseIdentifier: <#T##String#>)
    }

    

}
