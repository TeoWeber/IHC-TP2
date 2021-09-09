//
//  Activity2Step1ViewController.swift
//  IHC TP2
//
//  Created by Teo Weber on 08/09/21.
//

import UIKit

class Activity2Step1ViewController: UIViewController, ViewCodeProtocol {
    
    typealias CustomView = Activity2Step1View
    
    // MARK: - Life Cycle
    override func loadView() {
        view = Activity2Step1View()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Setup
    private func setupView() {
        title = Activities.activity2.localized
        setupButtons()
        setupTextFields()
    }
    
    private func setupButtons() {
        customView.submitButton.setTitle("SEND", for: .normal)
        customView.submitButton.addTarget(self, action: #selector(didTapSubmitButton), for: .touchUpInside)
    }
    
    private func setupTextFields() {
        customView.textField.placeholder = "Enter a message"
        customView.textField.keyboardType = .asciiCapable
    }
    
    // MARK: - Actions
    @objc func didTapSubmitButton() {
        navigationController?.pushViewController(Activity2Step2ViewController(message: customView.textField.text), animated: true)
    }
}
