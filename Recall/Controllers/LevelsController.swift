//
//  LevelsController.swift
//  Recall
//
//  Created by stamoulis nikolaos on 1/4/24.
//

import UIKit


class LevelsController: UIViewController {
    
    // MARK: -Components

        
 
    
    
    
    let cards = ["Lion", "Cat","Dog", "Luna"]
    
    // MARK: -Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
}

extension LevelsController {
    
    func style() {
        let layout = UICollectionViewFlowLayout()
        
        let levelsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        levelsCollectionView.isScrollEnabled = false
        
        
        
        view.addSubview(levelsCollectionView)
        
        
        
        levelsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            levelsCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            levelsCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            levelsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            levelsCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        levelsCollectionView.delegate = self
        levelsCollectionView.dataSource = self
        levelsCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
    }
    
    func layout() {
        
     
        
      
    }
}

extension LevelsController: UICollectionViewDelegate {

}

extension LevelsController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = .red
//        let label = UILabel(frame: CGRect(x: <#T##Int#>, y: <#T##Int#>, width: , height: <#T##Int#>))
        
        return cell
        
    }
    

}
extension LevelsController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfColumns: CGFloat = 2
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        
        let widthPerItem = (collectionView.frame.width / numberOfColumns) - layout.minimumInteritemSpacing
        return CGSize(width: widthPerItem, height: widthPerItem * 1.2)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
//    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
