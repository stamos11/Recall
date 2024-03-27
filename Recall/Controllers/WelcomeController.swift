//
//  WelcomeController.swift
//  Recall
//
//  Created by stamoulis nikolaos on 27/3/24.
//

import  UIKit

class WelcomeController: UIViewController {
    
    
    //MARK  -Components
    let label = UILabel()
    let welcomeImage = UIImageView()
  
    
    
    // MARK -Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
}

extension WelcomeController {
    
    func style() {
        view.translatesAutoresizingMaskIntoConstraints = true
        view.backgroundColor = .systemRed
        
        welcomeImage.translatesAutoresizingMaskIntoConstraints = false
        welcomeImage.contentMode = .scaleAspectFit
        welcomeImage.image = UIImage(imageLiteralResourceName: "eiffel")
        
        
        
        
    }
    
    func layout() {
        view.addSubview(welcomeImage)
        

        NSLayoutConstraint.activate([
            welcomeImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                welcomeImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                welcomeImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
                welcomeImage.heightAnchor.constraint(equalTo: welcomeImage.widthAnchor)
            
            
        ])
     
        

    }
}
