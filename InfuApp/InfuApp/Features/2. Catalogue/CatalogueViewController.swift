
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
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    static var storyboardId = "CollectionListViewController"
    static var storyboardName = "Catalogue"
    
    
    let viewModel = CatalogueViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        configureObservers()
        viewModel.onViewLoaded()
    }
    
    /* override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? DetailViewController else {
            return
        }
        destination.
    }
 */
    
    func configureViews() {
        // collectionView.register(UINib(nibName: CatalogueCell.cellCatalogueId, bundle: nil), forCellWithReuseIdentifier: CatalogueCell.cellCatalogueId)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func configureObservers() {
        viewModel.needUpdateCatalogue
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {[weak self] catalogueList in
                self?.collectionView.reloadData()
            })
            .disposed(by: disposeBag)
        
        viewModel.needNavigateToDetail
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {[weak self] infussionSelected in
                self?.navigateToDetail(dataCatalogue: infussionSelected)
            })
            .disposed(by: disposeBag)
    }
    
    func navigateToDetail(dataCatalogue:DataCatalogue) {
        guard let viewController = UIStoryboard(name: DetailViewController.storyboardName, bundle: nil)
            .instantiateViewController(withIdentifier: DetailViewController.storyboardId) as? DetailViewController
            else {
                return
        }

       // viewController.viewModel.dataCatalogue(for: ) =
            navigationController?.pushViewController(viewController, animated: true)
    }
    
}
// -------------------------- EXTENSION -----------------------------

extension CatalogueViewController: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.dataCatalogueCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatalogueCell.cellCatalogueId, for: indexPath) as? CatalogueCell else {
            return UICollectionViewCell()
        }
        if let dataCatalogue = viewModel.dataCatalogue(for: indexPath.row) {
            cell.configureCatalogueCell(image:dataCatalogue.image, text: dataCatalogue.title)
        }
        return cell
    }
    // POR QUE NO FUNCIONA CONFIGURAR TAMAÑO CELDA??????????
    // COMO CONFIGURAR ESPACIO ENTRE CELDAS?????????
    /* (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
    {

        return 5.0;
    }
 */
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sizeCell = collectionView.frame.width/2
        
        return CGSize(width: sizeCell, height: sizeCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.onDetailSelected(index: indexPath.row)
    }
    
    
    
}





