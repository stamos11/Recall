//
//  LevelsController.swift
//  Recall
//
//  Created by stamoulis nikolaos on 1/4/24.
//

import UIKit


class LevelsController: UIViewController {
    
    // MARK: -Components
    
    var cards = [Cards(animalName: "Luna", animalImage: nil, isMatched: false, isFlipped: false),
                 Cards(animalName: "Monkey", animalImage: nil, isMatched: false, isFlipped: false),
                 Cards(animalName: "Luna", animalImage: nil, isMatched: false, isFlipped: false),
                 Cards(animalName: "Monkey", animalImage: nil, isMatched: false, isFlipped: false)
    ]
    var matchedCards: [Cards] = [] {
        didSet {
            if matchedCards.count == 2 {
                if matchedCards[0].animalName == matchedCards[1].animalName {
                    print("Matched")
                    var card1 = matchedCards[0]
                    
                    self.cards.removeAll  {$0.animalName == card1.animalName}
                    
                    print(cards)
                    matchedCards.removeAll()
                    print(cards)
                } else {
                    
                }
            }
        }
    }
    // MARK: -Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()

    }
    
}

extension LevelsController {
    
    func setupCollectionView() {
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
        levelsCollectionView.register(CardCell.self, forCellWithReuseIdentifier: "Cell")
    }
    
    // Action
    
    
    
}

extension LevelsController: UICollectionViewDelegate {

}

extension LevelsController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CardCell else {  return UICollectionViewCell()  }
//        cell.card?.animalName = cards[indexPath.row]
        let card = cards[indexPath.item]
        cell.labelCell.text = card.animalName
        
        
        
        
        
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let card = collectionView.cellForItem(at: indexPath) as? CardCell else {  return }
        card.flip()
        if indexPath.row > 0 {
            matchedCards.append(cards[indexPath.row - 1])
        } else {
            print("out of range")
        }
        
    }
    

}
extension LevelsController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfColumns: CGFloat = 2
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        
        let widthPerItem = (collectionView.frame.width / numberOfColumns) - layout.minimumInteritemSpacing
        return CGSize(width: widthPerItem, height: widthPerItem * 1.2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

}
