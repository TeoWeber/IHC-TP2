//
//  Activity2Step2ViewController.swift
//  IHC TP2
//
//  Created by Teo Weber on 08/09/21.
//

import UIKit

class Activity2Step2ViewController: UIViewController, ViewCodeProtocol {
    
    typealias CustomView = Activity2Step2View
    
    // MARK: - Variables & Constants
    private var message: String?
    
    // MARK: - Init
    init(message: String?) {
        self.message = message
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func loadView() {
        view = Activity2Step2View()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Setup
    private func setupView() {
        title = Activities.activity2.localized
        customView.messageLabel.text = message
    }
}
