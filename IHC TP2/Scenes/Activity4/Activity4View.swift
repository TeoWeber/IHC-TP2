//
//  Activity4View.swift
//  IHC TP2
//
//  Created by Teo Weber on 08/09/21.
//

import Foundation
import UIKit
import SnapKit
import MaterialComponents

class Activity4View: UIView {
    
    // MARK: - Variable & Constants
    private lazy var scrollView = UIScrollView()
    private lazy var contentView = UIView()
    
    lazy var accelerometerLabel = UILabel()
    lazy var accelerometerTextFieldX = MDCOutlinedTextField()
    lazy var accelerometerTextFieldY = MDCOutlinedTextField()
    lazy var accelerometerTextFieldZ = MDCOutlinedTextField()
    private lazy var accelerometerStackView = UIStackView(
        arrangedSubviews: [accelerometerTextFieldX,
                           accelerometerTextFieldY,
                           accelerometerTextFieldZ]
    )
    
    lazy var locationLabel = UILabel()
    lazy var textFieldLat = MDCOutlinedTextField()
    lazy var textFieldLong = MDCOutlinedTextField()
    private lazy var locationStackView = UIStackView(arrangedSubviews: [textFieldLat, textFieldLong])
    
    lazy var magnetometerLabel = UILabel()
    lazy var magnetometerTextFieldX = MDCOutlinedTextField()
    lazy var magnetometerTextFieldY = MDCOutlinedTextField()
    lazy var magnetometerTextFieldZ = MDCOutlinedTextField()
    private lazy var magnetometerStackView = UIStackView(
        arrangedSubviews: [magnetometerTextFieldX,
                           magnetometerTextFieldY,
                           magnetometerTextFieldZ]
    )
    
    lazy var gyroLabel = UILabel()
    lazy var gyroTextFieldX = MDCOutlinedTextField()
    lazy var gyroTextFieldY = MDCOutlinedTextField()
    lazy var gyroTextFieldZ = MDCOutlinedTextField()
    private lazy var gyroStackView = UIStackView(
        arrangedSubviews: [gyroTextFieldX,
                           gyroTextFieldY,
                           gyroTextFieldZ]
    )
    
    private lazy var stackView = UIStackView(
        arrangedSubviews: [accelerometerLabel,
                           accelerometerStackView,
                           locationLabel,
                           locationStackView,
                           magnetometerLabel,
                           magnetometerStackView,
                           gyroLabel,
                           gyroStackView]
    )
    
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
extension Activity4View: CodeView {
    
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
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 16
        
        [accelerometerStackView,
         locationStackView,
         magnetometerStackView,
         gyroStackView].forEach({
            $0.alignment = .fill
            $0.axis = .horizontal
            $0.distribution = .fillEqually
            $0.spacing = 8
         })
        
        [accelerometerTextFieldX,
         accelerometerTextFieldY,
         accelerometerTextFieldZ,
         textFieldLat,
         textFieldLong,
         magnetometerTextFieldX,
         magnetometerTextFieldY,
         magnetometerTextFieldZ,
         gyroTextFieldX,
         gyroTextFieldY,
         gyroTextFieldZ].forEach({
            $0.font = UIFont.systemFont(ofSize: 12)
        })
    }
}
