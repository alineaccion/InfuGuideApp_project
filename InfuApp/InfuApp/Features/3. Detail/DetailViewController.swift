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
    
    static var storyboardId = "DetailViewController"
    static var storyboardName = "Detail"
    
    
    let storyBoard : UIStoryboard = UIStoryboard(name: "Detail", bundle:nil)
    private let viewModel = DetailViewModel()
    private let disposeBag = DisposeBag()

     let detailInfo = DataDetail(title: "Te verde",
                                 temperature: "100 ºC",
                                 time: "3min",
                                 infudescription: " ",
                                 properties: " ")
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func configureViews() {
       // detailView.dataSource = self
        
    }
    
    private func configureObservers() {
       /* viewModel.needUpdateDetailData
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] data in self?.detailView
                
            })
        
        //NECESARIO NAVEGAR AL TEMPORIZADOR?????
    */
    }

   
}
    
   

