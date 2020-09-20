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
    
    private var infuID: Infussion?
    
    var needNavigateToClock: PublishSubject<Infussion> = PublishSubject()
    
    func onViewLoaded() {
        let jsonData = loadJsonData(name: "SampleData")!
        do {
            infuID = try JSONDecoder().decode(Infussion.self, from: jsonData)
        } catch {}
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

    
   
   
    
    
    
}
