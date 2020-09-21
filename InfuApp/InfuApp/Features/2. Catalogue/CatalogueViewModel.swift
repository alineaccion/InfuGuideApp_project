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
    
    var infuFamilyID: Int?
    var infuAppData: InfuAppData?
    var infussionList : [Infussion]?
    var needNavigateToDetail: PublishSubject<Int> = PublishSubject()
   
    func onViewLoaded() {
        infussionList = getInfussionCatalogue()
    }
    
    func getInfuAppData() -> InfuAppData? {
        return infuAppData
    }
    
    func getTitleLabel() -> String {
        guard let titleLabel = infuAppData?.infuFamily.first(where: {$0.id == infuFamilyID})?.longTitle else { return ""}
        return titleLabel
    }
    
    func getInfussionCatalogue() -> [Infussion]? {
        if infuFamilyID == 0 {
            return infuAppData?.infussions.shuffled()
        } else {
            guard let infussionList = infuAppData?.infussions.filter({$0.infuFamilyID == infuFamilyID}) else { return nil }
            return  infussionList
        }
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
