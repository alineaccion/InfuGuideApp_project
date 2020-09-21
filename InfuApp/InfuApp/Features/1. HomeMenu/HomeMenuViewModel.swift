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
    
    /*Antes de json -> let listHomeMenu = [DataHomeMenu(title: "Estimulante", image: "Estimulante", infutype:                             .estimulante),
     DataHomeMenu(title: "Relajante", image: "Relajante", infutype: .relajante),
     DataHomeMenu(title: "Sano", image: "Sano", infutype: .saludable)]
     */
    
    func onViewLoaded() {
        // David no me mates por usar !, es para que no funcione si no hay datos :)
        // pediente hacer guard let porque a David no le ha gustado mi idea
        let jsonData = loadJsonData(name: "SampleData")!
        do {
            infuAppData = try JSONDecoder().decode(InfuAppData.self, from: jsonData)
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
