//
//  oiii.swift
//  projeto-marvel
//
//  Created by C94279A on 15/01/22.
//

import UIKit

protocol HomeVCProtocol: AnyObject {
    var isCalledOnce: Int { get set }
    var animation: Animation? { get set }
    var navBar: ConfigNavBar? { get set }
    var filter: Bool { get set }
    func reloadData()
    var heroSearchBar_: UISearchBar? { get set }
}
