//
//  NavigationBarConfig.swift
//  projeto-marvel
//
//  Created by C94279A on 14/12/21.
//

import UIKit

class ConfigNavBar: NSObject{
    
    var controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func navigationBarSettings() {
        let barAppearance = UINavigationBarAppearance()
        barAppearance.backgroundColor = UIColor(red: 29 / 255.0, green: 29 / 255.0, blue: 29 / 255.0, alpha: 1)
        controller.navigationItem.standardAppearance = barAppearance
        controller.navigationItem.scrollEdgeAppearance = barAppearance
    }
    
    func configureItems() {
        let logo = UIImage(named: "Marvel_Logo 1")
        let imageView = UIImageView(image:logo)
        controller.navigationItem.titleView = imageView
    }
    
    
}

