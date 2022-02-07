//
//  UserDetailTableViewCell.swift
//  projeto-marvel
//
//  Created by C94279A on 22/11/21.
//

import UIKit
import SnapKit
import Kingfisher


class UserDetailTableViewCell: UITableViewCell {
    
    static let identifier: String = "UserDetailTableViewCell"
    var gradient: Bool = false
    var detail = DetailViewController()
    
    lazy var userImageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 0, y: 0, width: 415, height: 390)
        image.contentMode = .scaleToFill
        image.layer.borderWidth = 1.0
        image.layer.cornerRadius = 10.0
        image.layer.masksToBounds = true
        
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview()
        userImageView.accessibilityLabel = "Foto ampliada do heroi a seguir \(String(describing: detail.heroTapped?.name))"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews(){

        if gradient == false{
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [UIColor.black.withAlphaComponent(2).cgColor,UIColor.black.withAlphaComponent(0.0).cgColor]
            gradientLayer.frame = bounds
            gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
            gradientLayer.cornerRadius = 10
            userImageView.layer.insertSublayer(gradientLayer, at: 0)
            gradient = true

        }
    }
    
    func addSubview() {
        self.contentView.addSubview(self.userImageView)
    }

    func setImageView(url: URL, rounded: Bool = false) {
        
        self.userImageView.kf.setImage(with: url,
                                       options: [
                                        .cacheOriginalImage
                                       ],
                                       completionHandler: { result in
            
        })
        
    }
    
    
}

