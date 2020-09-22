//
//  HomeMenuViewController.swift
//  InfuApp
//
//  Created by Alicia Moreno Alvarez on 10/09/2020.
//  Copyright © 2020 Alicia Moreno Alvarez. All rights reserved.
//

import UIKit
import RxSwift

class HomeMenuViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    // MARK: - Properties
    let viewModel = HomeMenuViewModel()
    private let disposeBag = DisposeBag()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        configureObservers()
        viewModel.onViewLoaded()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func configureViews() {
        tableView.register(UINib(nibName: CellHomeMenu.cellHomeMenuId, bundle: nil), forCellReuseIdentifier: CellHomeMenu.cellHomeMenuId)
        tableView.delegate = self
        tableView.dataSource = self
    }
    func configureObservers() {
        
        viewModel.needNavigateToCatalogue
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {[weak self] familyID in
                self?.navigateToCatalogue(familyID: familyID)
            })
            .disposed(by: disposeBag)
    }
    
    func navigateToCatalogue(familyID: Int) {
        guard let viewController = UIStoryboard(name: CatalogueViewController.storyboardName, bundle: nil)
            .instantiateViewController(withIdentifier: CatalogueViewController.storyboardId) as? CatalogueViewController else { return }
        viewController.viewModel.infuAppData = viewModel.getInfuAppData()
        viewController.viewModel.infuFamilyID = familyID
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension HomeMenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  viewModel.infuFamilyCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellHomeMenu.cellHomeMenuId, for: indexPath) as? CellHomeMenu else { return UITableViewCell()
        }
        guard let infuFamilyItem = viewModel.infuFamilyItem(for: indexPath.row) else { return cell }
        // se incluyen valores vacios por defecto
        cell.configureCell(image: infuFamilyItem.image, text: infuFamilyItem.longTitle, imageSymbol:infuFamilyItem.symbol)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.onInfuFamilySelected(index: indexPath.row)
        
    }
    
}
