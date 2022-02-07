//
//  File.swift
//  projeto-marvel
//
//  Created by C94279A on 19/01/22.
//

import Foundation

protocol ReachabilityProtocol {
    func checkReachable()
    var isConnected: Bool? { get set }
}
