//
//  ListCell.swift
//  projeto-marvel
//
//  Created by C94279A on 19/11/21.
//


import UIKit

class ListCell: UICollectionViewCell {
    
    var gradient: Bool = false
    
    @IBOutlet weak var cardListImageView: UIImageView!
    @IBOutlet weak var cardListTitle: UILabel!
    
    
    override func layoutSubviews(){
        
        if gradient == false{
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [UIColor.black.withAlphaComponent(2).cgColor,UIColor.black.withAlphaComponent(0.0).cgColor]
            gradientLayer.frame = cardListImageView.frame
            gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
            gradientLayer.cornerRadius = 10
            cardListImageView.layer.insertSublayer(gradientLayer, at: 0)
            gradient = true
            
        }
    }
    
}

