//
//  MenuTypesViewController.swift
//  InfuApp
//
//  Created by Alicia Moreno Alvarez on 10/09/2020.
//  Copyright © 2020 Alicia Moreno Alvarez. All rights reserved.
//

import UIKit
import RxSwift
// ocultar navigation bar

class HomeMenuViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    // MARK: - Properties
    
    private let viewModel = HomeMenuViewModel()
    private let disposeBag = DisposeBag()
    
    var listMenuType: [DataHomeMenu]?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        configureObservers()
        viewModel.onViewLoaded()
        
    }
    
    func configureViews() {
        tableView.register(UINib(nibName: CellHomeMenu.cellHomeMenuId, bundle: nil), forCellReuseIdentifier: CellHomeMenu.cellHomeMenuId)
        tableView.delegate = self
        tableView.dataSource = self
    }
    func configureObservers() {
        viewModel.needUpdateHomeMenu
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {[weak self] menuList in
                self?.listMenuType = menuList
                self?.tableView.reloadData()
            })
            .disposed(by: disposeBag)
        
        viewModel.needNavigateToCatalogue
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {[weak self] typeSelected in
                self?.navigateToInfuCollectionType(infuType: typeSelected)
            })
            .disposed(by: disposeBag)
    }
    
    func navigateToInfuCollectionType(infuType: InfuType) {
        guard let viewController = UIStoryboard(name: CatalogueViewController.storyboardName, bundle: nil)
            .instantiateViewController(withIdentifier: CatalogueViewController.storyboardId) as? CatalogueViewController else { return }
        
        //  viewController.viewModel.infuType = infuType
        navigationController?.pushViewController(viewController, animated: true)
        
    }
}

extension HomeMenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listMenuType?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellHomeMenu.cellHomeMenuId, for: indexPath) as? CellHomeMenu else { return UITableViewCell()
        }
        guard let data = listMenuType?[indexPath.row] else { return cell }
        // se incluyen valores vacios por defecto
        cell.configureCell(image: data.image, text: data.title)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.onMenuTypeSelected(index: indexPath.row)
        
    }
    
}
