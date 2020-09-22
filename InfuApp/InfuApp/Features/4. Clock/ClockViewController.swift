//
//  ClockViewController.swift
//  InfuApp
//
//  Created by Alicia Moreno Alvarez on 21/09/2020.
//  Copyright © 2020 Alicia Moreno Alvarez. All rights reserved.
//

import Foundation
import Lottie
import RxSwift

class ClockViewController: UIViewController {
    
    static var storyboardId = "ClockViewController"
    static var storyboardName = "Clock"
    
    let viewModel = ClockViewModel()
    
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startStopButton: UIButton!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var lottieContainerView: UIView!
    private var animationView: AnimationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureObservers()
        viewModel.onViewLoaded()
        configureViews()
        configureLottieAnimation()
    }
    
    func configureObservers() {
        viewModel.needUpdateCountDown
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {[weak self] timeInSeconds in
                self?.uploadCountDownLabel(timeInSeconds: timeInSeconds)
            })
            .disposed(by: disposeBag)
        
        
        viewModel.needFinishCountDown
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {[weak self] isFinish in
                self?.finishCountDown()
            })
            .disposed(by: disposeBag)
    }
    
    func configureViews() {
        let backButton = UIImage(named: "ic_back")
        self.navigationController?.navigationBar.backIndicatorImage = backButton
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backButton
        self.navigationController?.navigationBar.tintColor = .font
        
        addLogoToNavigationBarItem()
        resetButton.isEnabled = false
        infoLabel.text = viewModel.infoLabel()
    }
    
    func configureLottieAnimation() {
        // 2. Start AnimationView with animation name (without extension)
        
        animationView = .init(name: "clock")
        
        animationView!.frame = lottieContainerView.bounds
        
        // 3. Set animation content mode
        
        animationView!.contentMode = .scaleAspectFit
        
        // 4. Set animation loop mode
        
        animationView!.loopMode = .loop
        
        // 5. Adjust animation speed
        
        animationView!.animationSpeed = 1.0
        
        lottieContainerView.addSubview(animationView!)
    }
    
    private func finishCountDown() {
        
        animationView!.stop()
        configureButtonStart()
        
        let alertController = UIAlertController(title: "¡Enhorabuena!",
                                                message: "¡Tu infusión de \(viewModel.getInfussionName()) ya está lista!!",
            preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Genial!!",
                                                style: .default))
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func uploadCountDownLabel(timeInSeconds: String) {
        self.timerLabel.text = timeInSeconds
    }
    
    @IBAction private  func startAction(_ sender: Any) {
        if startStopButton.titleLabel?.text == "Iniciar" {
            viewModel.startAction()
            animationView!.play()
            resetButton.isEnabled = true
            configureButtonStop()
        } else {
            viewModel.stopAction()
            animationView!.stop()
            configureButtonStart()
        }
    }
    
    @IBAction private  func resetAction(_ sender: Any) {
        viewModel.resetAction()
        resetButton.isEnabled = false
        startStopButton.setTitle("Iniciar", for: .normal)
        animationView!.stop()
    }
    
    private func configureButtonStart() {
        startStopButton.setTitle("Iniciar", for: .normal)
        startStopButton.backgroundColor = .buttonBackground
        startStopButton.setTitleColor(.font, for: .normal)
    }
    
    private func configureButtonStop() {
        startStopButton.setTitle("Parar", for: .normal)
        startStopButton.backgroundColor = .splashBackground
        startStopButton.setTitleColor(.red, for: .normal)
    }
}


