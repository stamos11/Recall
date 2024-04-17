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
    var nextLevelButton =  UIButton()
    
    var cards: [Card] = [] {
        didSet {
            print("cards: \(cards)\n")
        }
    }
    
    var matchedCards: [(Card,Int)] = [] {
        didSet {
            if matchedCards.count == 2 {
                if matchedCards[0].0.animalName == matchedCards[1].0.animalName {
                    print("Matched")
                    cards[matchedCards[0].1].isMatched = true
                    cards[matchedCards[1].1].isMatched = true
                    
                    let firstIndexPath = IndexPath(row: matchedCards[0].1, section: 0)
                    let secondIndexPath = IndexPath(row: matchedCards[1].1, section: 0)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.7){
                        self.levelsCollectionView.reloadItems(at: [firstIndexPath, secondIndexPath])
                    }
                    
                    print(cards)
                    matchedCards.removeAll()
                } else {
                    cards[matchedCards[0].1].isFlipped = false
                    cards[matchedCards[1].1].isFlipped = false
                    print(cards)
                    let firstIndexPath = IndexPath(row: matchedCards[0].1, section: 0)
                    let secondIndexPath = IndexPath(row: matchedCards[1].1, section: 0)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                        self.levelsCollectionView.reloadItems(at: [firstIndexPath, secondIndexPath])
                    }
                    matchedCards.removeAll()
                    
                }
            }
        }
    }
    
    
    // MARK: -Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        setupCollectionView()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        levelsCollectionView.reloadData()
    }
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        cards.removeAll()
//    }
    
}

extension LevelsController {
    
    func setupButton() {
        view.addSubview(nextLevelButton)
        nextLevelButton.translatesAutoresizingMaskIntoConstraints  = false
        nextLevelButton.setTitle("Next Level", for: .normal)
        nextLevelButton.setTitleColor(.black, for: .normal)
        nextLevelButton.layer.cornerRadius = 8
        nextLevelButton.backgroundColor = .orange
        
        NSLayoutConstraint.activate([
            nextLevelButton.widthAnchor.constraint(equalToConstant: 100),
            nextLevelButton.heightAnchor.constraint(equalToConstant: 40),
            nextLevelButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nextLevelButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
            
        ])
    }
}

extension LevelsController {
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        levelsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        levelsCollectionView.isScrollEnabled = true
        
        view.addSubview(levelsCollectionView)
        
        levelsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            levelsCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            levelsCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            levelsCollectionView.topAnchor.constraint(equalTo: nextLevelButton.bottomAnchor, constant: 20),
            levelsCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        levelsCollectionView.delegate = self
        levelsCollectionView.dataSource = self
        levelsCollectionView.register(CardCell.self, forCellWithReuseIdentifier: "Cell")
        

    }

    
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
        guard let cardCell = collectionView.cellForItem(at: indexPath) as? CardCell else {  return }
        
        let matchedCard = (cardCell.card!, indexPath.item)
        matchedCards.append(matchedCard)
        
        cardCell.card?.flip()

    }
    

}
extension LevelsController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfColumns: CGFloat = CGFloat(cards.count > 8 ? 4 : 2)
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        
        let widthPerItem = (collectionView.frame.width / numberOfColumns) - layout.minimumInteritemSpacing
        let heightPerItem = (collectionView.frame.height / CGFloat( CGFloat(cards.count) / numberOfColumns)) - layout.minimumLineSpacing
        
        return CGSize(width: widthPerItem, height: heightPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

}

#Preview {
    LevelsController()
}
