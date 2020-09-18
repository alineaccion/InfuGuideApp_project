//
//  InfuDetailViewModel.swift
//  InfuApp
//
//  Created by Alicia Moreno Alvarez on 15/09/2020.
//  Copyright © 2020 Alicia Moreno Alvarez. All rights reserved.
//

import RxSwift
import UIKit

class DetailViewModel {
    
    var needUpdateDetailData: PublishSubject<Bool> = PublishSubject()
    
    
    func onViewLoaded() {
        needUpdateDetailData.onNext(true)
    }
   
    
    
    
}
