//
//  Loading_Animation.swift
//  projeto-marvel
//
//  Created by C94279A on 15/01/22.
//

import UIKit
import Lottie

class Animation: NSObject{
    
    var controller: UIViewController
    var animationView: AnimationView?
    var isHidden: Bool = false
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    
    func loaderAnimation() {
        self.animationView!.loopMode = .loop
        self.animationView!.animationSpeed = 0.5
        self.animationView!.play()
        self.animationView?.isHidden = false
    }
    
    
    func inicializarAnimacao() {
        
        animationView = .init(name: "loader")
        animationView?.frame =  CGRect(x: controller.view.bounds.width/2 - 15, y: controller.view.bounds.height - 50, width: 30, height: 30)
        self.animationView!.contentMode = .scaleAspectFit
        controller.view.addSubview(self.animationView!)
        self.animationView?.isHidden = true
    }
}
