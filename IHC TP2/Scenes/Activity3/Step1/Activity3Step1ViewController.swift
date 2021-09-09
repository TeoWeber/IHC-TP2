//
//  Activity3Step1ViewController.swift
//  IHC TP2
//
//  Created by Teo Weber on 08/09/21.
//

import UIKit
import CoreMotion

class Activity3Step1ViewController: UIViewController, ViewCodeProtocol {
    
    typealias CustomView = Activity3Step1View
    
    // MARK: - Variables & Constants
    private let motion = CMMotionManager()
    private var timer: Timer?
    
    // MARK: - Life Cycle
    override func loadView() {
        view = Activity3Step1View()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startAccelerometers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.timer?.invalidate()
        self.timer = nil
    }
    
    private func goToNextView() {
        navigationController?.pushViewController(Activity3Step2ViewController(), animated: true)
    }
    
    // MARK: - Setup
    private func setupView() {
        title = Activities.activity3.localized
        setupTextFields()
    }
    
    private func setupTextFields() {
        customView.textFieldX.placeholder = "X"
        customView.textFieldX.isEnabled = false
        customView.textFieldX.isUserInteractionEnabled = false
        
        customView.textFieldY.placeholder = "Y"
        customView.textFieldY.isEnabled = false
        customView.textFieldY.isUserInteractionEnabled = false
        
        customView.textFieldZ.placeholder = "Z"
        customView.textFieldZ.isEnabled = false
        customView.textFieldZ.isUserInteractionEnabled = false
    }
    
    // MARK: - Accelerometer
    private func startAccelerometers() {
        if self.motion.isAccelerometerAvailable {
            self.motion.accelerometerUpdateInterval = 1.0 / 10.0
            self.motion.startAccelerometerUpdates()
            
            self.timer = Timer(fire: Date(), interval: (1.0/10.0), repeats: true, block: { timer in
                if let data = self.motion.accelerometerData {
                    self.customView.textFieldX.text = "X \(data.acceleration.x)"
                    self.customView.textFieldY.text = "Y \(data.acceleration.y)"
                    self.customView.textFieldZ.text = "Z \(data.acceleration.z)"
                    if abs(data.acceleration.x) > 0.95 || abs(data.acceleration.y) > 0.95 || abs(data.acceleration.z) > 0.95 {
                        self.goToNextView()
                    }
                }
            })
            RunLoop.current.add(self.timer!, forMode: RunLoop.Mode.default)
        }
    }
}
