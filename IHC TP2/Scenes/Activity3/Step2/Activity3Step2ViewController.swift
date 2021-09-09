//
//  Activity3Step2ViewController.swift
//  IHC TP2
//
//  Created by Teo Weber on 08/09/21.
//

import UIKit

class Activity3Step2ViewController: UIViewController, ViewCodeProtocol {
    
    typealias CustomView = Activity3Step2View
    
    // MARK: - Life Cycle
    override func loadView() {
        view = Activity3Step2View()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Setup
    private func setupView() {
        title = Activities.activity3.localized
        customView.messageLabel.text = "Posição Correta"
    }
}
