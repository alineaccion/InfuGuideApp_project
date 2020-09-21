
//
//  CatalogueViewController.swift
//  InfuApp
//
//  Created by Alicia Moreno Alvarez on 14/09/2020.
//  Copyright © 2020 Alicia Moreno Alvarez. All rights reserved.
//

import UIKit
import RxSwift

class CatalogueViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var TitleLabel: UILabel!
    
    static var storyboardId = "CollectionListViewController"
    static var storyboardName = "Catalogue"
    
    
    let viewModel = CatalogueViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false

        
        viewModel.onViewLoaded()
        
        addLogoToNavigationBarItem()
        configureViews()
        configureObservers()
    }
    
    
    func configureViews() {
        // No necesario si la celda esta dentro de la collectionView -> collectionView.register(UINib(nibName: CatalogueCell.cellCatalogueId, bundle: nil), forCellWithReuseIdentifier: CatalogueCell.cellCatalogueId)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        TitleLabel.text = viewModel.getTitleLabel()
    }
    
    func configureObservers() {
        viewModel.needNavigateToDetail
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {[weak self] infussionId in
                self?.navigateToDetail(infussionId: infussionId )
            })
            .disposed(by: disposeBag)
    }
    
    func navigateToDetail(infussionId: Int) {
        guard let viewController = UIStoryboard(name: DetailViewController.storyboardName, bundle: nil)
            .instantiateViewController(withIdentifier: DetailViewController.storyboardId) as? DetailViewController
            else {
                return
        }

        viewController.viewModel.infuID = infussionId
            navigationController?.pushViewController(viewController, animated: true)
    }
    
}


extension CatalogueViewController: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.catalogueCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatalogueCell.cellCatalogueId, for: indexPath) as? CatalogueCell else {
            return UICollectionViewCell()
        }
        if let itemCatalogue = viewModel.catalogueItem(for: indexPath.row) {
            cell.configureCatalogueCell(image:itemCatalogue.icon, text: itemCatalogue.title)
        }
        return cell
    }
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Numero de columnas. La fraccion indica en cuantas partes se divide la pantalla. Pendiente mejorar
        let sizeCell = collectionView.frame.width/3
        
        return CGSize(width: sizeCell, height: sizeCell * 1.3)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.onCatalogueSelected(index: indexPath.row)
    }
    
    
    
}





