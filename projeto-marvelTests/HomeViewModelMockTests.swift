//
//  HomeViewModelMockTests.swift
//  projeto-marvelTests
//
//  Created by C94279A on 19/01/22.
//

import XCTest
@testable import projeto_marvel

class HomeViewModelMockTests: XCTestCase {
    var sut: HomeViewModel?
    
    override func setUp() {
        super.setUp()
        sut = HomeViewModel(apiRequestMarvel: ApiRequestMarvelMocked_WellSucceed(), homevc: mockviewcontroler(), coreDataController: coreDataIsEmpty(), reachConnection: isReacheable())
    }
    
    // testa se o array do carossel está trazendo o primeiro elemento e é maior que zero
    func testArrayCarouselIsBringingFirstHero() throws {
       
        sut?.fillArrayCarouselWithApiResponse()
        guard let heroes = sut?.arrayCarousel else { return }
        guard let viewReloaded = sut?.homevc?.isCalledOnce else { return }
        XCTAssertEqual(heroes[0].name, "3-D Man")
        XCTAssertTrue(heroes.count > 0)
        XCTAssertEqual(viewReloaded, 1)
    }

    // testa se o array da lista está trazendo o primeiro elemento e é maior que zero
    func testArrayListIsBringingFirstHero() throws {
        
        sut?.fillArrayListWithApiResponse()
        guard let heroes = sut?.filteredArrayList else { return }
        XCTAssertEqual(heroes[0].name, "Abomination (Ultimate)")
        XCTAssertTrue(heroes.count > 0)
    }

    // testa se o scroll tras 20 herois na primeira chamada
    func testIsScrollInfinitoBringingTwenty() {
        
        sut?.scrollInfinito()
        guard let heroes = sut?.filteredArrayList else { return }
        XCTAssertEqual(heroes.count, 20)
    }
    
    // testa se o os arrays sao populados pelo conteudo do core data
    func testSucessToCoreDataContent() {
        sut?.FillArraysWithCoreDataContent()
        guard let heroesCarousel = sut?.arrayCarousel else { return }
        guard let heroesList = sut?.filteredArrayList else { return }
        XCTAssertEqual(heroesCarousel.count, 5)
        XCTAssertTrue(heroesList.count >= 15)
    }
    
    // testa se quando usuario estiver com internet busca retorna dados da api
    func testUserIsConectedToNetworkAndBringsAnyDataFromTheApi() {
       
       sut?.setArrayList()
       guard let heroes = sut?.filteredArrayList else { return }
       XCTAssertTrue(heroes.count > 0)
    }
    
    // testa se quando usuario estiver sem internet retorna dados do core data
    func testUserIsNotConectedToNetworkAndBringsAnyDataFromTheCoreData() {
        sut = HomeViewModel(apiRequestMarvel: ApiRequestMarvelMocked_UnSucceed(), homevc: mockviewcontroler(), coreDataController: coreDataHasData(), reachConnection: isNotReacheable())
       sut?.setArrayList()
       guard let heroes = sut?.filteredArrayList else { return }
       XCTAssertTrue(heroes.count > 0)
    }
    
}
