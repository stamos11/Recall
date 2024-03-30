//
//  MainController.swift
//  Recall
//
//  Created by stamoulis nikolaos on 27/3/24.
//

import Foundation
import UIKit

class MainController: UIViewController {
    
    // MARK: - componets
    
    var logOutButton =  UIButton()
    var levelTableView = UITableView()
    var levels: [String] = ["Level 1", "Level 2", "Level 3", "Level 4", "Level 5"]
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        style()

        layout()
        
    }
    
}

extension MainController {
    
    // MARK: - Setup Views
    
    func style() {
        view.addSubview(logOutButton)
        view.addSubview(levelTableView)
        //view.bringSubviewToFront(levelTableView)
        
        levelTableView.translatesAutoresizingMaskIntoConstraints = false
        logOutButton.translatesAutoresizingMaskIntoConstraints = false
        
        logOutButton.configuration = .filled()
        logOutButton.setTitle("Log out", for: .normal)
        logOutButton.backgroundColor = .darkGray
        logOutButton.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
        
        let tableViewFrame = CGRect(x: 0, y: 100, width: 200, height: 200)
        levelTableView = UITableView(frame: view.bounds, style: .plain)
        levelTableView.delegate = self
        levelTableView.dataSource = self
        levelTableView.reloadData()
        levelTableView.register(UITableViewCell.self, forCellReuseIdentifier: "levelCell")
        
    }
    
    func layout() {
        
        
        NSLayoutConstraint.activate([
                  levelTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                  levelTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                  levelTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                  levelTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
              ])
              
              // Setup constraints for button
              NSLayoutConstraint.activate([
                  logOutButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                  logOutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
              ])
//        NSLayoutConstraint.activate([
//            logOutButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
//            logOutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            logOutButton.heightAnchor.constraint(equalToConstant: 50),
//            logOutButton.widthAnchor.constraint(equalToConstant: 100)
//        ])
//        
//        NSLayoutConstraint.activate([
//            levelTableView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
//            levelTableView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
//            view.trailingAnchor.constraint(equalToSystemSpacingAfter: levelTableView.trailingAnchor, multiplier: 2),
//            levelTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
//        ])
    }
    
    //MARK: - Actions
    @objc func logoutTapped() {
        
    }
}

extension MainController: UITableViewDelegate {}

extension MainController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        levels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = levelTableView.dequeueReusableCell(withIdentifier: "levelCell", for: indexPath)
        cell.textLabel?.text = " mina and nikos"
        
        return cell
    }

}
