//
//  HomeMenuViewModel.swift
//  InfuApp
//
//  Created by Alicia Moreno Alvarez on 10/09/2020.
//  Copyright © 2020 Alicia Moreno Alvarez. All rights reserved.
//

import Foundation
import RxSwift

class HomeMenuViewModel {
    // MARK: - Properties
    var needNavigateToCatalogue: PublishSubject<Int> = PublishSubject()
    private var infuAppData: InfuAppData?
    
    func onViewLoaded() {
        loadAppData()
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
    
    private func loadAppData() {
        let jsonData = loadJsonData(name: "SampleData")!
        do {
            infuAppData = try JSONDecoder().decode(InfuAppData.self, from: jsonData)
        } catch {}
        
    }
    
    func getInfuAppData() -> InfuAppData? {
        return infuAppData
    }
    
    func infuFamilyCount() -> Int {
        guard let infuFamilyList = infuAppData?.infuFamily else { return 0 }
        return  infuFamilyList.count
    }
    
    func infuFamilyItem(for index: Int) -> InfuFamily? {
        guard let infuFamilyList = infuAppData?.infuFamily else { return nil }
        if index < infuFamilyList.count {
            return infuFamilyList[index]
        } else {
            return nil
        }
    }
    
    func onInfuFamilySelected(index: Int) {
        guard let infuFamilyList = infuAppData?.infuFamily else { return }
        if index < infuFamilyList.count {
            needNavigateToCatalogue.onNext(infuFamilyList[index].id)
        }
    }
}
