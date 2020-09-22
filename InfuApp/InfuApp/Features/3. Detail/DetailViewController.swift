//
//  DetailViewController.swift
//  InfuApp
//
//  Created by Alicia Moreno Alvarez on 15/09/2020.
//  Copyright © 2020 Alicia Moreno Alvarez. All rights reserved.
//

import RxSwift
import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var titleDetail: UILabel!
    @IBOutlet weak var tagTimeDetail: UILabel!
    @IBOutlet weak var tagTemperatureDetail: UILabel!
    @IBOutlet weak var tagInfuFamilyDetail: UILabel!
    @IBOutlet weak var infoTextDetail: UILabel!
    @IBOutlet weak var propertiesTextDetail: UILabel!
    @IBOutlet weak var shopButtonDetail: UIButton!
    @IBOutlet weak var symbolDetail: UIImageView!
    
    static var storyboardId = "DetailViewController"
    static var storyboardName = "Detail"
    
    let viewModel = DetailViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        addLogoToNavigationBarItem()
        viewModel.onViewLoaded()
        configureViews()
        
    }
    
    private func configureViews() {
        let backButton = UIImage(named: "ic_back")
        self.navigationController?.navigationBar.backIndicatorImage = backButton
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backButton
        self.navigationController?.navigationBar.tintColor = .font
        
        imageDetail.image = UIImage(named:viewModel.getImageDetail())
        titleDetail.text = viewModel.getTitleDetail()
        tagTimeDetail.text = viewModel.getTagTimeDetail()
        tagTemperatureDetail.text = viewModel.getTagTemperatureDetail()
        tagInfuFamilyDetail.text = viewModel.getTagInfuFamilyDetail()
        infoTextDetail.text = viewModel.getInfoTextDetail()
        propertiesTextDetail.text = viewModel.getPropertiesTextDetail()
        shopButtonDetail.isHidden = viewModel.ShopButtonDtailIsHidden()
        symbolDetail.image = UIImage(named: viewModel.getSymbolDetail())
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(named: "icon_clock"), style: .plain, target: self, action: #selector(navigateToClock))]
    }
    
    private func configureObservers() {
        viewModel.needNavigateToClock
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {[weak self] infussionId in
                self?.navigateToClock()
            })
            .disposed(by: disposeBag)
    }
    
    @objc func navigateToClock() {
        guard let viewController = UIStoryboard(name: ClockViewController.storyboardName, bundle: nil)
            .instantiateViewController(withIdentifier: ClockViewController.storyboardId) as? ClockViewController
            else {
                return
        }
        
        viewController.viewModel.infuAppData = viewModel.getInfuAppData()
        viewController.viewModel.infussionId = viewModel.infuID
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func shopInfussion(_ sender: Any) {
        if let url = URL(string: viewModel.getShopDetail()) {
            UIApplication.shared.open(url)
        }
    }
    
}
