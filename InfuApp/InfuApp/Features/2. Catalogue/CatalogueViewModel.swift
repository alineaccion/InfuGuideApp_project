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
    
    private var infuAppData: InfuAppData?
    var infussionList : [Infussion]?
    //private let navigationIdentifier = "SEGUE_FROM_CELLCATALOGUE_TO_DETAIL"
    
    var needNavigateToDetail: PublishSubject<Int> = PublishSubject()
    // var needUpdateCatalogue: PublishSubject<Bool> = PublishSubject()
    
    /* let listCatalogue = [DataCatalogue(title: "Te negro", image: "1"),
     DataCatalogue(title: "Te rojo", image: "2"),
     DataCatalogue(title: "Te verde", image: "3"),
     DataCatalogue(title: "Te matcha", image: "4"),
     DataCatalogue(title: "Mate", image: "5")]
     */
    func onViewLoaded() {
        let jsonData = loadJsonData(name: "SampleData")!
        do {
            infuAppData = try JSONDecoder().decode(InfuAppData.self, from: jsonData)
        } catch {}
        
        infussionList = getInfussionCatalogue()
    }
    
    private func loadJsonData(name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        return nil
    }
    
    func getTitleLabel() -> String {
        guard let titleLabel = infuAppData?.infuFamily.first(where: {$0.id == infuFamilyID})?.longTitle else { return ""}
        return titleLabel
        
    }
    
    func getInfussionCatalogue() -> [Infussion]? {
        guard let infussionList = infuAppData?.infussions.filter({$0.infuFamilyID == infuFamilyID}) else { return nil }
        return  infussionList
    }
    
    func catalogueCount() -> Int {
        guard let infussionCount = infussionList?.count else { return 0 }
        return  infussionCount
    }
    
    func catalogueItem(for index: Int) -> Infussion? {
        guard let infussionList = infussionList else { return nil }
        if index < infussionList.count {
            return infussionList[index]
        } else {
            return nil
        }
    }
    
    func onCatalogueSelected(index: Int) {
        guard let infussionList = infussionList else { return }
        if index < infussionList.count {
            needNavigateToDetail.onNext(infussionList[index].id)
        }
    }
    
}
