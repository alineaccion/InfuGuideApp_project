//
//  ClockViewModel.swift
//  InfuApp
//
//  Created by Alicia Moreno Alvarez on 21/09/2020.
//  Copyright © 2020 Alicia Moreno Alvarez. All rights reserved.
//

import Foundation
import RxSwift

class ClockViewModel {
    
    var needUpdateCountDown: PublishSubject<String> = PublishSubject()
    var needUpdateButtons: PublishSubject<Bool> = PublishSubject()
    var needFinishCountDown: PublishSubject<Bool> = PublishSubject()
    
    var infussionId: Int?
    var infussion: Infussion?
    private var timer: Timer?
    private var counter = 0
    var infuAppData: InfuAppData?
    
    func onViewLoaded() {
        infussion = getInfussion()
        counter = getTimeInSeconds()
        formatCounter()
    }
    
    func getInfussion() -> Infussion? {
        guard let infussionObtained = infuAppData?.infussions.first(where: {$0.id == infussionId}) else { return nil }
        return  infussionObtained
    }
    
    func getInfussionName() -> String {
        guard let infussionName = infussion?.title else { return "" }
        return infussionName
    }
    
    func infoLabel() -> String  {
        guard let time = infussion?.tags.time, let infussionName = infussion?.title else { return "" }
        return "Preparando tú infusión de \(infussionName) - \(time) min"
    }
    
    private func getTime() -> String {
        guard let time = infussion?.tags.time else { return "" }
        return "\(time)"
    }
    
    private func getTimeInSeconds() -> Int {
        guard let time = infussion?.tags.time else { return 0 }
        return time * 60
    }
    
    func startAction() {
        initCountDown()
    }
    
    func stopAction() {
        stopTimer()
    }
    
    func resetAction() {
        stopTimer()
        counter = getTimeInSeconds()
        formatCounter()
    }
    
    private func initCountDown() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        updateButtons(resetButtons: false)
    }
    
    private func updateButtons(resetButtons: Bool) {
        needUpdateButtons.onNext(resetButtons)
    }
    
    @objc private func updateCounter() {
        if counter > 0 {
            counter -= 1
            formatCounter()
        } else {
            stopTimer()
            needFinishCountDown.onNext(true)
        }
    }
    
    private func formatCounter() {
        let minutes = Int(counter) / 60 % 60
        let seconds = Int(counter) % 60
        needUpdateCountDown.onNext(String(format:"%02i:%02i", minutes, seconds))
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func finishCountDown() {
        
    }
}
