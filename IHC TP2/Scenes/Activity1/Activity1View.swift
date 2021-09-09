//
//  Activity1View.swift
//  IHC TP2
//
//  Created by Teo Weber on 08/09/21.
//

import Foundation
import UIKit
import SnapKit
import MaterialComponents

class Activity1View: UIView {
    
    // MARK: - Variable & Constants
    private lazy var scrollView = UIScrollView()
    private lazy var contentView = UIView()
    lazy var textFieldA = MDCOutlinedTextField()
    lazy var textFieldB = MDCOutlinedTextField()
    lazy var submitButton = MDCButton()
    lazy var resultLabel = UILabel()
    
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
extension Activity1View: CodeView {
    
    func buildViewHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        [textFieldA,
         textFieldB,
         submitButton,
         resultLabel].forEach({ contentView.addSubview($0) })
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
        
        textFieldA.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(16)
        }
        
        textFieldB.snp.makeConstraints { make in
            make.top.equalTo(textFieldA.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        submitButton.snp.makeConstraints { make in
            make.top.equalTo(textFieldB.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        resultLabel.snp.makeConstraints { make in
            make.top.equalTo(submitButton.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.greaterThanOrEqualToSuperview().inset(16)
        }
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .white
    }
}
