//
//  LevelsController.swift
//  Recall
//
//  Created by stamoulis nikolaos on 1/4/24.
//

import UIKit


class LevelsController: UIViewController {
    
    // MARK: -Components
    
    var levelsCollectionView: UICollectionView!
    var cards = [Card(animalName: "Luna", animalImage: nil, isMatched: false, isFlipped: false),
                 Card(animalName: "Monkey", animalImage: nil, isMatched: false, isFlipped: false),
                 Card(animalName: "Luna", animalImage: nil, isMatched: false, isFlipped: false),
                 Card(animalName: "Monkey", animalImage: nil, isMatched: false, isFlipped: false)
    ]

    var matchedCards: [(Card,Int)] = [] {
        didSet {
            if matchedCards.count == 2 {
                if matchedCards[0].0.animalName == matchedCards[1].0.animalName {
                    print("Matched")
                    cards[matchedCards[0].1].isMatched = true
                    cards[matchedCards[1].1].isMatched = true
                    //self.cards.removeAll  {$0.animalName == matchedCards[0].0.animalName}
                    DispatchQueue.main.async {
                        self.levelsCollectionView.reloadData()
                    }
                    
                    print(cards)
                    matchedCards.removeAll()
                } else {
                    cards[matchedCards[0].1].isFlipped = false
                    cards[matchedCards[1].1].isFlipped = false
                    matchedCards.removeAll()
                    print(cards)
                    DispatchQueue.main.async {
                        self.levelsCollectionView.reloadData()
                    }
                    
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
        levelsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
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

        cell.card = cards[indexPath.item]

        
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let card = collectionView.cellForItem(at: indexPath) as? CardCell else {  return }
        
      //  card.flip()
        
        let matchedCard = (card.card!, indexPath.item)
        matchedCards.append(matchedCard)
        
        card.card?.isFlipped.toggle()
        
//        if indexPath.row > 0 {
//            matchedCards.append(cards[indexPath.row - 1])
//        } else {
//            print("out of range")
//        }
//        
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
