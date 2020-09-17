//
//  SplashViewController.swift
//  InfuApp
//
//  Created by Alicia Moreno Alvarez on 10/09/2020.
//  Copyright © 2020 Alicia Moreno Alvarez. All rights reserved.
//

import UIKit
import RxSwift

class SplashViewController: UIViewController {
    private let viewModel = SplashViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureObservers()
        viewModel.onViewLoaded()
        
    }
    
    private func configureObservers() {
        viewModel.needNavigateToMenuTypes
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] identifier in
                self?.navigate(to: identifier)
            })
            .disposed(by: disposeBag)
    }
    
    private func navigate(to identifier: String) {
        performSegue(withIdentifier: identifier, sender: nil)
        
    }
}


