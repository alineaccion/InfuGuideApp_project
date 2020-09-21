//
//  InfuDetailViewController.swift
//  InfuApp
//
//  Created by Alicia Moreno Alvarez on 15/09/2020.
//  Copyright © 2020 Alicia Moreno Alvarez. All rights reserved.
//

import RxSwift
import UIKit

class DetailViewController: UIViewController {
    // scroll view-> stack view que contiene toda la info
    //view imagen, label title, stack horizontal view tags, , info label, properties label, shop button
    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var titleDetail: UILabel!
    @IBOutlet weak var tagTimeDetail: UILabel!
    @IBOutlet weak var tagTemperatureDetail: UILabel!
    @IBOutlet weak var tagInfuFamilyDetail: UILabel!
    @IBOutlet weak var infoTextDetail: UILabel!
    @IBOutlet weak var propertiesTextDetail: UILabel!
    @IBOutlet weak var shopButtonDetail: UIButton!

    static var storyboardId = "DetailViewController"
    static var storyboardName = "Detail"
    
    let viewModel = DetailViewModel()
    private let disposeBag = DisposeBag()

   /* Anterior a json
     let detailInfo = DataDetail(title: "Te verde",
                                 temperature: "100 ºC",
                                 time: "3min",
                                 infudescription: " ",
                                 properties: " ")
 */
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        addLogoToNavigationBarItem()
        viewModel.onViewLoaded()
        configureViews()
        
    }
    
    private func configureViews() {
        imageDetail.image = UIImage(named:viewModel.getImageDetail())
        titleDetail.text = viewModel.getTitleDetail()
        tagTimeDetail.text = viewModel.getTagTimeDetail()
        tagTemperatureDetail.text = viewModel.getTagTemperatureDetail()
        tagInfuFamilyDetail.text = viewModel.getTagInfuFamilyDetail()
        infoTextDetail.text = viewModel.getInfoTextDetail()
        propertiesTextDetail.text = viewModel.getPropertiesTextDetail()
        shopButtonDetail.isHidden = viewModel.ShopButtonDtailIsHidden()
        
    }
    
    private func configureObservers() {
       /* viewModel.needUpdateDetailData
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] data in self?.detailView
                
            })
        
        //NECESARIO NAVEGAR AL TEMPORIZADOR?????
    */
    }

    @IBAction func shopInfussion(_ sender: Any) {
        if let url = URL(string: viewModel.getShopDetail()) {
            UIApplication.shared.open(url)
        }
    }
    
}
