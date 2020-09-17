
//
//  CollectionListViewController.swift
//  InfuApp
//
//  Created by Alicia Moreno Alvarez on 14/09/2020.
//  Copyright © 2020 Alicia Moreno Alvarez. All rights reserved.
//

import UIKit
import RxSwift

class CatalogueViewController: UIViewController {
    
    static var storyboardId = "CollectionListViewController"
    static var storyboardName = "Collection"
    
    var listCollection: [DataCatalogue]?
    
    private let viewModel = CollectionListViewModel()
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    /*func configureViews() {
        collectionView.register(UINib(nibName: CatalogueCell.cellCollectionId, bundle: nil), forCellWithReuseIdentifier: CatalogueCell.cellCollectionId)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
 */
    
    
    func configureObservers() {
           viewModel.needUpdateCollection
               .observeOn(MainScheduler.instance)
               .subscribe(onNext: {[weak self] collectionList in
                   self?.listCollection = collectionList
                   self?.collectionView.reloadData()
               })
               .disposed(by: disposeBag)
           
           /* viewModel.needNavigateToDetail
               .observeOn(MainScheduler.instance)
               .subscribe(onNext: {[weak self] collectionSelected in
                   self?.navigateToInfuDetail(infuType: typeSelected)
               })
           .disposed(by: disposeBag)
        
       }
            */
    }
    
    func navigateToInfuDetail(infuType: InfuType) {
        guard let viewController = UIStoryboard(name: CatalogueViewController.storyboardName, bundle: nil)
            .instantiateViewController(withIdentifier: CatalogueViewController.storyboardId) as? CatalogueViewController else { return }
        
        viewController.viewModel.infuType = infuType
        navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    
       
}

/* extension CollectionListViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return viewModel.count()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as? CatalogueCell else {
            return UICollectionViewCell()
    
        }
        
        return cell
 */

    


