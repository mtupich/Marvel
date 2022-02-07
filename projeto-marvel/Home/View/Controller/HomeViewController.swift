//
//  ViewController.swift
//  projeto-marvel
//
//  Created by C94279A on 18/11/21.
//

import UIKit
import Lottie
import CoreData
import SystemConfiguration
import Firebase

class HomeViewController: UIViewController, HomeVCProtocol {
    
    var isCalledOnce: Int = 0
    var urlCall = UrlApiMarvel()
    var animation: Animation?
    var navBar: ConfigNavBar?
    var filter: Bool = false
    var heroSearchBar_: UISearchBar?
    var paginacao: Bool = false
    var statusCode = 0
    
    lazy var viewmodel: HomeViewModel = {
        return HomeViewModel(apiRequestMarvel: ApiMarvelRequest(), homevc: self, coreDataController: CoreDataController(), reachConnection: Reachability(controller: self))
    }()
    
    
    // UI
    @IBOutlet weak var heroSearchBar: UISearchBar!
    @IBOutlet weak var carouselCollectionView: UICollectionView!
    @IBOutlet weak var listCollectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navBar = ConfigNavBar(controller: self)
        
        self.navBar?.configureItems()
        self.navBar?.navigationBarSettings()
        
        self.viewmodel.reachConnection = Reachability(controller: self)
        self.viewmodel.reachConnection?.checkReachable()
        
        self.animation = Animation(controller: self)
        self.animation?.inicializarAnimacao()
        
        self.homeVC_Delegate_DataSource()
        self.viewmodel.reachConnection?.checkReachable()
        
        self.heroSearchBar_ = heroSearchBar
        
        viewmodel.setArrayCarousel()
        viewmodel.setArrayList()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        Analytics.logEvent("Screen_View",
                           parameters: [AnalyticsParameterScreenName: "Home View Controller",
                                        AnalyticsParameterScreenClass: "HomeViewController"])
        Analytics.setUserID("1234")
        Analytics.setUserProperty("Favorite_fruit", forName: "Watermelon")
    }
    
    
    func homeVC_Delegate_DataSource() {
        carouselCollectionView.dataSource = self
        carouselCollectionView.delegate = self
        listCollectionView.dataSource = self
        listCollectionView.delegate = self
        heroSearchBar.delegate = self
    }
    
    
    func reloadData(){
        self.carouselCollectionView.reloadData()
        self.listCollectionView.reloadData()
    }
    
    
    
}
