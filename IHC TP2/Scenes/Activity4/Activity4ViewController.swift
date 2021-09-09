//
//  Activity4ViewController.swift
//  IHC TP2
//
//  Created by Teo Weber on 08/09/21.
//

import UIKit
import CoreMotion
import CoreLocation

class Activity4ViewController: UIViewController, ViewCodeProtocol {
    
    typealias CustomView = Activity4View
    
    // MARK: - Variables & Constants
    private let motion = CMMotionManager()
    private var timer: Timer?
    private let locationManager = CLLocationManager()
    
    // MARK: - Life Cycle
    override func loadView() {
        view = Activity4View()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startAccelerometers()
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = 10.0
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.timer?.invalidate()
        self.timer = nil
    }
    
    // MARK: - Setup
    private func setupView() {
        title = Activities.activity4.localized
        setupTextFields()
        setupLabels()
    }
    
    private func setupTextFields() {
        [customView.accelerometerTextFieldX,
         customView.accelerometerTextFieldY,
         customView.accelerometerTextFieldZ,
         customView.textFieldLat,
         customView.textFieldLong,
         customView.magnetometerTextFieldX,
         customView.magnetometerTextFieldY,
         customView.magnetometerTextFieldZ,
         customView.gyroTextFieldX,
         customView.gyroTextFieldY,
         customView.gyroTextFieldZ].forEach({
            $0.isEnabled = false
            $0.isUserInteractionEnabled = false
        })
        
        customView.accelerometerTextFieldX.placeholder = "X"
        customView.accelerometerTextFieldY.placeholder = "Y"
        customView.accelerometerTextFieldZ.placeholder = "Z"
        customView.textFieldLat.placeholder = "Lat"
        customView.textFieldLong.placeholder = "Long"
        customView.magnetometerTextFieldX.placeholder = "X"
        customView.magnetometerTextFieldY.placeholder = "Y"
        customView.magnetometerTextFieldZ.placeholder = "Z"
        customView.gyroTextFieldX.placeholder = "X"
        customView.gyroTextFieldY.placeholder = "Y"
        customView.gyroTextFieldZ.placeholder = "Z"
    }
    
    private func setupLabels() {
        customView.accelerometerLabel.text = "Accelerometer"
        customView.locationLabel.text = "Location"
        customView.magnetometerLabel.text = "Magnetometer"
        customView.gyroLabel.text = "Gyro"
    }
    
    // MARK: - Accelerometer
    private func startAccelerometers() {
        if self.motion.isAccelerometerAvailable {
            self.motion.accelerometerUpdateInterval = 1.0 / 10.0
            self.motion.startAccelerometerUpdates()
            self.motion.startMagnetometerUpdates()
            self.motion.startGyroUpdates()
            
            self.timer = Timer(fire: Date(), interval: (1.0/10.0), repeats: true, block: { timer in
                if let data = self.motion.accelerometerData {
                    self.customView.accelerometerTextFieldX.text = "X \(data.acceleration.x)"
                    self.customView.accelerometerTextFieldY.text = "Y \(data.acceleration.y)"
                    self.customView.accelerometerTextFieldZ.text = "Z \(data.acceleration.z)"
                }
                if let data = self.motion.magnetometerData {
                    self.customView.magnetometerTextFieldX.text = "X \(data.magneticField.x)"
                    self.customView.magnetometerTextFieldY.text = "Y \(data.magneticField.y)"
                    self.customView.magnetometerTextFieldZ.text = "Z \(data.magneticField.z)"
                }
                if let data = self.motion.gyroData {
                    self.customView.gyroTextFieldX.text = "X \(data.rotationRate.x)"
                    self.customView.gyroTextFieldY.text = "Y \(data.rotationRate.y)"
                    self.customView.gyroTextFieldZ.text = "Z \(data.rotationRate.z)"
                }
            })
            RunLoop.current.add(self.timer!, forMode: RunLoop.Mode.default)
        }
    }
}

extension Activity4ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.customView.textFieldLat.text = "Lat \(location.coordinate.latitude)"
        self.customView.textFieldLong.text = "Long \(location.coordinate.longitude)"
    }
}
