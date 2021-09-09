//
//  Activity3Step1View.swift
//  IHC TP2
//
//  Created by Teo Weber on 08/09/21.
//

import Foundation
import UIKit
import SnapKit
import MaterialComponents

class Activity3Step1View: UIView {
    
    // MARK: - Variable & Constants
    private lazy var scrollView = UIScrollView()
    private lazy var contentView = UIView()
    lazy var textFieldX = MDCOutlinedTextField()
    lazy var textFieldY = MDCOutlinedTextField()
    lazy var textFieldZ = MDCOutlinedTextField()
    lazy var stackView = UIStackView(arrangedSubviews: [textFieldX, textFieldY, textFieldZ])
    
    // MARK: - Init
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup
extension Activity3Step1View: CodeView {
    
    func buildViewHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
    }
    
    func setupConstraints() {
        scrollView.snp.makeConstraints{ make in
            make.top.bottom.equalTo(safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
        }
        
        contentView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().priority(.low)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(16)
            make.bottom.greaterThanOrEqualToSuperview().inset(16)
        }
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .white
        
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        
        textFieldX.font = UIFont.systemFont(ofSize: 12)
        textFieldY.font = UIFont.systemFont(ofSize: 12)
        textFieldZ.font = UIFont.systemFont(ofSize: 12)
    }
}
