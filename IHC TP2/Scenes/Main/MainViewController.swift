//
//  MainViewController.swift
//  IHC TP2
//
//  Created by Teo Weber on 08/09/21.
//

import UIKit

class MainViewController: UIViewController, ViewCodeProtocol {
    
    typealias CustomView = MainView
    
    static let MAIN_VIEW_CELL = "MAIN_VIEW_CELL"
    
    // MARK: - Life Cycle
    override func loadView() {
        view = MainView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Setup
    func setupView() {
        title = "Home"
        setupTableView()
    }
    
    func setupTableView() {
        customView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: MainViewController.MAIN_VIEW_CELL)
        customView.tableView.delegate = self
        customView.tableView.dataSource = self
        customView.tableView.tableFooterView = UIView(frame: .zero)
    }
}

// MARK: - UITableViewDelegate | UITableViewDataSource
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Activities.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainViewController.MAIN_VIEW_CELL, for: indexPath)
        cell.textLabel?.text = Activities.allCases[indexPath.row].localized
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch Activities.allCases[indexPath.row] {
        case .activity1:
            navigationController?.pushViewController(Activity1ViewController(), animated: true)
        case .activity2:
            navigationController?.pushViewController(Activity2Step1ViewController(), animated: true)
        case .activity3:
            navigationController?.pushViewController(Activity3Step1ViewController(), animated: true)
        case .activity4:
            navigationController?.pushViewController(Activity4ViewController(), animated: true)
        }
    }
}
