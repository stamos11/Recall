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
        view.backgroundColor = .white
        style()
        layout()
        
    }
    
}

extension MainController {
    
    // MARK: - Setup Views
    
    func style() {
        view.addSubview(logOutButton)
        view.addSubview(levelTableView)
        
        
        levelTableView.translatesAutoresizingMaskIntoConstraints = false
        logOutButton.translatesAutoresizingMaskIntoConstraints = false
        
        logOutButton.configuration = .filled()
        logOutButton.setTitle("Log out", for: .normal)
        logOutButton.backgroundColor = .darkGray
        logOutButton.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
        
        
        
        levelTableView.delegate = self
        levelTableView.dataSource = self
        levelTableView.register(UITableViewCell.self, forCellReuseIdentifier: "levelCell")
        levelTableView.reloadData()
        
    }
    
    func layout() {
        
        // TableView
        NSLayoutConstraint.activate([
                        levelTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                        levelTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                        levelTableView.topAnchor.constraint(equalTo: logOutButton.bottomAnchor),
                        levelTableView.heightAnchor.constraint(equalToConstant: 400)
              ])
              
              // Button
              NSLayoutConstraint.activate([
                  logOutButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                  logOutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
              ])
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
        cell.textLabel?.text = levels[indexPath.row]
        
        return cell
    }

}
