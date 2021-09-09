//
//  MainView.swift
//  IHC TP2
//
//  Created by Teo Weber on 08/09/21.
//

import Foundation
import UIKit
import SnapKit

class MainView: UIView {
    
    // MARK: - Variable & Constants
    lazy var tableView = UITableView()
    
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
extension MainView: CodeView {
    
    func buildViewHierarchy() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .white
    }
}
