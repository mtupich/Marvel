//
//  Extension.swift
//  projeto-marvel
//
//  Created by C94279A on 13/01/22.
//

import UIKit
import SystemConfiguration

class Reachability: ReachabilityProtocol {
    
    var isConnected: Bool?
    let reachability = SCNetworkReachabilityCreateWithName(nil, "www.raywenderlich.com")
    var controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func checkReachable() {
        var flags = SCNetworkReachabilityFlags()
        
        
        SCNetworkReachabilityGetFlags(self.reachability!, &flags)
        
        if (!isNetworkReachable(with: flags)) {
            let alert = UIAlertController(title: "Atention!", message: "You are offline, please verify your connection", preferredStyle: .alert)
            // Create the actions
            let closeAction = UIAlertAction(title: "Close", style:
                                                UIAlertAction.Style.default) {
                UIAlertAction in
            }
            // Add the actions
            alert.addAction(closeAction)
            controller.present(alert, animated: true, completion: nil)
            self.isConnected = false
        } else {
            isConnected = true
        }
        
        
        func isNetworkReachable (with flags: SCNetworkReachabilityFlags) -> Bool {
            let isReachable = flags.contains (.reachable)
            let needsConnection = flags.contains(.connectionRequired)
            let canConnectAutomatically = flags.contains(.connectionOnDemand) || flags.contains(.connectionOnTraffic)
            let canConnectWithoutUserInteraction = canConnectAutomatically && !flags.contains(.interventionRequired)
            return isReachable && (!needsConnection || canConnectWithoutUserInteraction)
        }
    }
    
}
