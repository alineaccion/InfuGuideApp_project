//
//  CatalogueViewModel.swift
//  InfuApp
//
//  Created by Alicia Moreno Alvarez on 15/09/2020.
//  Copyright © 2020 Alicia Moreno Alvarez. All rights reserved.
//

import UIKit
import RxSwift

class CatalogueViewModel {
    // No me mateis, tiene que ser obligatorio que se le pase un id para acceder a los datos :)
    var infuFamilyID: Int!
    
    private let navigationIdentifier = "SEGUE_FROM_CELLCATALOGUE_TO_DETAIL"

    
    var needNavigateToDetail: PublishSubject<DataCatalogue> = PublishSubject()
    var needUpdateCatalogue: PublishSubject<Bool> = PublishSubject()
    
    let listCatalogue = [DataCatalogue(title: "Te negro", image: "1"),
                          DataCatalogue(title: "Te rojo", image: "2"),
                          DataCatalogue(title: "Te verde", image: "3"),
                          DataCatalogue(title: "Te matcha", image: "4"),
                          DataCatalogue(title: "Mate", image: "5")]
    func onViewLoaded() {
    needUpdateCatalogue.onNext(true)
    }
    
    func onDetailSelected(index: Int) {
           if index < listCatalogue.count {
            needNavigateToDetail.onNext(listCatalogue[index])
           }
       }
    func dataCatalogue(for index: Int) -> DataCatalogue? {
        if index < listCatalogue.count {
            return listCatalogue[index]
        } else {
            return nil
        }
    }
    
    func dataCatalogueCount() -> Int {
       return  listCatalogue.count
    }
}
