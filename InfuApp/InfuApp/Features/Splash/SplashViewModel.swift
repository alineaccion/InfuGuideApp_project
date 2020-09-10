//
//  SplashViewModel.swift
//  InfuApp
//
//  Created by Alicia Moreno Alvarez on 10/09/2020.
//  Copyright © 2020 Alicia Moreno Alvarez. All rights reserved.
//

import UIKit
import RxSwift

class SplashViewModel {
    private let navigationidentifier = "SEGUE_FROM_SPLASH_TO_MENUTYPES"
    
    //Rx Propoerties
    
    var needNavigateToMenuTypes: PublishSubject<String> = PublishSubject()
    
    func onViewLoaded() {
        needNavigateToMenuTypes.onNext(navigationidentifier)
    }
    
    
}
