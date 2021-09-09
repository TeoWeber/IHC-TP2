//
//  Activity2Step2View.swift
//  IHC TP2
//
//  Created by Teo Weber on 08/09/21.
//

import Foundation
import UIKit
import SnapKit
import MaterialComponents

class Activity2Step2View: UIView {
    
    // MARK: - Variable & Constants
    private lazy var scrollView = UIScrollView()
    private lazy var contentView = UIView()
    lazy var messageLabel = UILabel()
    
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
extension Activity2Step2View: CodeView {
    
    func buildViewHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(messageLabel)
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
        
        messageLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(16)
            make.bottom.greaterThanOrEqualToSuperview().inset(16)
        }
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .white
        messageLabel.numberOfLines = 0
        
    }
}
