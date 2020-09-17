//
//  CollectionListViewModel.swift
//  InfuApp
//
//  Created by Alicia Moreno Alvarez on 15/09/2020.
//  Copyright © 2020 Alicia Moreno Alvarez. All rights reserved.
//

import UIKit
import RxSwift

class CatalogueListViewModel {
    
    var infuType: InfuType?
    
    var needNavigateToDetail: PublishSubject<DataCatalogue> = PublishSubject()
    var needUpdateCatalogue: PublishSubject<[DataCatalogue]> = PublishSubject()
    
    let listCatalogue = [DataCatalogue(title: "Te negro", image: "1"),
                          DataCatalogue(title: "Te rojo", image: "2"),
                          DataCatalogue(title: "Te verde", image: "3"),
                          DataCatalogue(title: "Te matcha", image: "4"),
                          DataCatalogue(title: "Mate", image: "5")]
    func onViewLoaded() {
    needUpdateCatalogue.onNext(listCatalogue)
    }
    
    func onCollectionListSelected(index: Int) {
           if index < listCatalogue.count {
            needNavigateToDetail.onNext(listCatalogue[index])
           }
       }
                          

    
    
}
