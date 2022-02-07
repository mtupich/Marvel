//
//  homeViewModel.swift
//  projeto-marvel
//
//  Created by C94279A on 14/01/22.
//

import Foundation

class HomeViewModel {
    
    var filteredArrayList: [Hero] = []
    var arrayList: [Hero] = []
    var arrayCarousel: [Hero] = []
    
    var apiRequestMarvel: HttpClient
    weak var homevc: HomeVCProtocol?
    let context = DataBaseController.persistentContainer.viewContext
    let coreDataController: CoreDataControllerProtocol
    var reachConnection: ReachabilityProtocol?
    var isLoading = false
    
    // injecao de dependencia por inicializador?
    init(apiRequestMarvel: HttpClient, homevc: HomeVCProtocol, coreDataController: CoreDataControllerProtocol, reachConnection: ReachabilityProtocol) {
        self.apiRequestMarvel = apiRequestMarvel
        self.homevc = homevc
        self.coreDataController = coreDataController
        self.reachConnection = reachConnection
    }
    
    func fillArrayCarouselWithApiResponse() {
        apiRequestMarvel.getData(method: .GET) { data in
            switch data {
            case .success(let jsonResult):
                let heroes = jsonResult.data.results
                self.arrayCarousel = Array(heroes[0...4])
                self.coreDataController.saveCharacterInTheDataBase(heroes: heroes)
                DispatchQueue.main.async {
                    self.homevc?.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fillArrayListWithApiResponse() {
        //        if self.homevc?.heroSearchBar_ != nil {
        apiRequestMarvel.getData(method: .GET) { data in
            switch data {
            case .success(let jsonResult):
                let heroes = jsonResult.data.results
                self.filteredArrayList = Array(heroes[5..<heroes.count])
                self.coreDataController.saveCharacterInTheDataBase(heroes: heroes)
                DispatchQueue.main.async {
                    self.homevc?.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
        
        
    }
    
    func FillArraysWithCoreDataContent() {
        let ArrayOfHeroesInTheDataBase: [SuperHeroEntity] = self.coreDataController.getdataFromCoreData()
        var heroes: [Hero] = []
        
        for hero in ArrayOfHeroesInTheDataBase {
            //  if hero.label != nil {
            let newHero = Hero(id: 0, name: (hero.heroName) ?? "", description: "", thumbnail: APIImageResult(path: hero.imageHeroPath ?? "", extension: hero.imageHeroExtension ?? ""), comics: Comics(available: 0, collectionURI: "", items: [], returned: 0), series: Comics(available: 0, collectionURI: "", items: [], returned: 0), urls: [["": ""]])
            
            heroes.append(newHero)
            
        }
        
        if heroes.count > 0 {
            self.filteredArrayList = Array(heroes[5..<heroes.count])
            self.arrayCarousel = Array(heroes[0...4])
        }
        DispatchQueue.main.async {
            self.homevc?.reloadData()
            
        }
    }
    
    // fazer uma validacao com o scroll para gerir requests simultaneos
    func scrollInfinito() {
        if isLoading == false {
            isLoading = true
            var offset = self.filteredArrayList.count
            
            apiRequestMarvel.getData(method: .GET) { response in
                switch response {
                case.success(let character):
                    let response = character.data.results
                    self.filteredArrayList += response
                    self.coreDataController.saveCharacterInTheDataBase(heroes: response)
                    offset+=20
                    self.isLoading = false
                    DispatchQueue.main.async {
                        self.homevc?.animation?.animationView?.isHidden = true
                    }
                case.failure(let error):
                    self.isLoading = false
                    print(error)
                }
            }
            self.homevc?.reloadData()
        }
    }
    
    func setArrayCarousel() {
        if self.reachConnection?.isConnected == true {
            fillArrayCarouselWithApiResponse()
        }else{
            FillArraysWithCoreDataContent()
        }
    }
    
    func setArrayList() {
        if self.reachConnection?.isConnected == true {
            fillArrayListWithApiResponse()
        }else{
            FillArraysWithCoreDataContent()
        }
    }
    
    
    
}
