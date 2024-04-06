//
//  CardCellView.swift
//  Recall
//
//  Created by stamoulis nikolaos on 6/4/24.
//

import Foundation
import UIKit


class CardCell: UICollectionViewCell {
    
    var card: Cards?
    let labelCell = UILabel()
    var isFlipped: Bool = false {
        didSet {
            if isFlipped {
                labelCell.backgroundColor = .brown
                UIView.transition(with: self.contentView, duration: 0.5, options: .transitionFlipFromLeft, animations: nil)
            } else {
                labelCell.backgroundColor = .green
                UIView.transition(with: self.contentView, duration: 2, options: .transitionFlipFromRight, animations: nil)
            }
        }
    }
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func flip() {
        isFlipped.toggle()
        
        
    }
    
    func configureCell() {
        contentView.addSubview(labelCell)
        labelCell.translatesAutoresizingMaskIntoConstraints = false
        labelCell.textAlignment = .center
        labelCell.backgroundColor = .systemGray
        labelCell.text = card?.animalName
        
    
        NSLayoutConstraint.activate([
            labelCell.topAnchor.constraint(equalTo: contentView.topAnchor),
            labelCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            labelCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            labelCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

}
