//
//  CarosselCell.swift
//  projeto-marvel
//
//  Created by C94279A on 19/11/21.
//

import UIKit
import Kingfisher

class CarouselCell: UICollectionViewCell {
    
    var gradient: Bool = false
    
    @IBOutlet weak var cardCarosselImageView: UIImageView!
    @IBOutlet weak var cardCarosselLabel: UILabel!
    
    override func layoutSubviews(){
        
        if gradient == false{
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [UIColor.black.withAlphaComponent(2).cgColor,UIColor.black.withAlphaComponent(0.0).cgColor]
            gradientLayer.frame = cardCarosselImageView.frame
            gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
            gradientLayer.cornerRadius = 10
            cardCarosselImageView.layer.insertSublayer(gradientLayer, at: 0)
            gradient = true
            
        }
    }
    
    
    
    
}



