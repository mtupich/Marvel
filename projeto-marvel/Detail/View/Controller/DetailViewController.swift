//
//  DetailViewController.swift
//  projeto-marvel
//
//  Created by C94279A on 19/11/21.
//

import UIKit
import Firebase

class DetailViewController: UIViewController{
    
    var detailscene: TableViewDetail?
    var configNavbar: ConfigNavBar?
    let reuseIdentifier =  "ListCell"
    var heroTapped: Hero?
    
    override func loadView() {
        self.detailscene = TableViewDetail()
        self.view = detailscene
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailscene?.configTableViewProtocols(delegate: self, dataSource: self)
        self.configNavbar = ConfigNavBar(controller: self)
        configNavbar?.configureItems()
        configNavbar?.navigationBarSettings()
        detailscene?.tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        Analytics.logEvent("Screen_View",
                           parameters: [AnalyticsParameterScreenName: "Detail View Controller",
                                        AnalyticsParameterScreenClass: "DetailViewController"])
    }
}
