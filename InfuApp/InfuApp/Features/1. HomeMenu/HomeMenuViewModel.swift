//
//  MenuTypesViewModel.swift
//  InfuApp
//
//  Created by Alicia Moreno Alvarez on 10/09/2020.
//  Copyright © 2020 Alicia Moreno Alvarez. All rights reserved.
//

import Foundation
import RxSwift

class HomeMenuViewModel{
    // MARK: - Properties
    
    var needNavigateToCatalogue: PublishSubject<InfuType> = PublishSubject()
    var needUpdateHomeMenu: PublishSubject<[DataHomeMenu]> = PublishSubject()
    
    let listHomeMenu = [DataHomeMenu(title: "Estimulante", image: "Estimulante", infutype:                             .estimulante),
                        DataHomeMenu(title: "Relajante", image: "Relajante", infutype: .relajante),
                        DataHomeMenu(title: "Sano", image: "Sano", infutype: .saludable)]
    
       
       func onViewLoaded() {
        needUpdateHomeMenu.onNext(listHomeMenu)
        
       }
    func onMenuTypeSelected(index: Int) {
        if index < listHomeMenu.count {
            needNavigateToCatalogue.onNext(listHomeMenu[index].infutype)
        }
    }
    
    
       
    
}
