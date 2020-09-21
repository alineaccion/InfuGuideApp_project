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
    
    var infuAppData: InfuAppData?
    var infuID: Int?
    private var infussionData: Infussion?
    
    var needNavigateToClock: PublishSubject<Infussion> = PublishSubject()
    
    func onViewLoaded() {
        let jsonData = loadJsonData(name: "SampleData")!
        do {
            infuAppData = try JSONDecoder().decode(InfuAppData.self, from: jsonData)
        } catch {}
        
        infussionData = getInfussion()
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
    
    func getInfussion() -> Infussion? {
        guard let infussionObtained = infuAppData?.infussions.first(where: {$0.id == infuID}) else { return nil }
        return  infussionObtained
    }
    
    func getImageDetail() -> String {
        guard let imageObtained = infussionData?.image else { return "" }
        return imageObtained
    }
    
    func getTitleDetail() -> String {
        guard let titleObtained = infussionData?.title else { return "" }
        return titleObtained
        
    }
    
    func getTagTimeDetail() -> String {
        guard let timeObtained = infussionData?.tags.time else { return "" }
        return timeObtained
        
    }
    
    func getTagTemperatureDetail() -> String {
        guard let temperatureObtained = infussionData?.tags.temp else { return "" }
               return temperatureObtained
    }
    
    func getTagInfuFamilyDetail() -> String {
        
        guard let familyDetailObtained = infuAppData?.infuFamily.first(where: {$0.id == infussionData?.infuFamilyID}) else { return ""  }
        return familyDetailObtained.title
        
    }
    
    func getInfoTextDetail() -> String {
        guard let infoTextDetail = infussionData?.generalInfo else { return ""}
        return infoTextDetail
           
       }
    
    func getPropertiesTextDetail() -> String {
        guard let infoPropertiesDetail = infussionData?.properties else { return ""}
              return infoPropertiesDetail
    }
    
    func getSymbolDetail() -> String {
        guard let symbolDetailObtained = infuAppData?.infuFamily.first(where: {$0.id == infussionData?.infuFamilyID}) else { return ""}
        return symbolDetailObtained.symbol
    }
    
    func getShopDetail() -> String {
        guard let buttonShop = infussionData?.shopUrl else { return ""}
        return buttonShop
           
       }
    func ShopButtonDtailIsHidden() -> Bool {
        guard (infussionData?.shopUrl) != nil else {return true}
        return false
    }
    
    
    
      
    
    
    
    
}
