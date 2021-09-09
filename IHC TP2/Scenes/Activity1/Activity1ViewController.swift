//
//  Activity1ViewController.swift
//  IHC TP2
//
//  Created by Teo Weber on 08/09/21.
//

import UIKit

class Activity1ViewController: UIViewController, ViewCodeProtocol {
    
    typealias CustomView = Activity1View
    
    // MARK: - Life Cycle
    override func loadView() {
        view = Activity1View()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Setup
    private func setupView() {
        title = Activities.activity1.localized
        setupButtons()
        setupTextFields()
        setupLabels()
    }
    
    private func setupButtons() {
        customView.submitButton.setTitle("SUM", for: .normal)
        customView.submitButton.addTarget(self, action: #selector(didTapSubmitButton), for: .touchUpInside)
    }
    
    private func setupTextFields() {
        customView.textFieldA.placeholder = "Enter a number"
        customView.textFieldA.keyboardType = .numberPad
        customView.textFieldB.placeholder = "Enter a number"
        customView.textFieldB.keyboardType = .numberPad
    }
    
    private func setupLabels() {
        customView.resultLabel.text = "RESULT"
    }
    
    // MARK: - Actions
    @objc func didTapSubmitButton() {
        guard let numberA = Int(customView.textFieldA.text ?? ""), let numberB = Int(customView.textFieldB.text ?? "") else {
            customView.resultLabel.text = "RESULT"
            return
        }
        customView.resultLabel.text = String(numberA + numberB)
    }
}
