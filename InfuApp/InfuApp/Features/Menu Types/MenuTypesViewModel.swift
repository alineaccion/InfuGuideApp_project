//
//  MenuTypesViewModel.swift
//  InfuApp
//
//  Created by Alicia Moreno Alvarez on 10/09/2020.
//  Copyright © 2020 Alicia Moreno Alvarez. All rights reserved.
//

import Foundation
import RxSwift

class MenuTypesViewModel{
    // MARK: - Properties
    
    var needNavigateToCollection: PublishSubject<InfuType> = PublishSubject()
    var needUpdateMenu: PublishSubject<[DataMenuType]> = PublishSubject()
    
    let listMenuType = [DataMenuType(title: "Estimulante", image: "Estimulante", infutype:                             .estimulante),
                        DataMenuType(title: "Relajante", image: "Relajante", infutype: .relajante),
                        DataMenuType(title: "Sano", image: "Sano", infutype: .saludable)]
    
       
       func onViewLoaded() {
        needUpdateMenu.onNext(listMenuType)
        
       }
    func onMenuTypeSelected(index: Int) {
        if index < listMenuType.count {
            needNavigateToCollection.onNext(listMenuType[index].infutype)
        }
    }
    
    
       
    
}
