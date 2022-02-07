//
//  projeto_marvelTests.swift
//  projeto-marvelTests
//
//  Created by C94279A on 18/11/21.
//

import XCTest
@testable import projeto_marvel


class projeto_marvelTests: XCTestCase {
    
    var sut: ApiMarvelRequest!

    override func setUp() {
        super.setUp()
        sut = ApiMarvelRequest()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    // Teste verifica se a chamada da api trás algum dado
    func testSucessfulFetchHeroes() {
        
        let expectation = self.expectation(description: "expect success")
        
        sut.getData(method: .GET) { result in
            
            if case .success(let heroes) = result {
                XCTAssertGreaterThan(heroes.data.results.count, 0)
                expectation.fulfill()
            }
            
        }
        
        waitForExpectations(timeout: 3.0)
    }
    // Teste verifica se a requisicao está trazendo 20 herois na primeira chamada
    func testFetchHeroesIsbringing20IntheFirstCall () {
        let expectation = self.expectation(description: "expect success")
        
        sut.getData(method: .GET) { result in
            
            if case .success(let heroes) = result {
                XCTAssertEqual(heroes.data.results.count, 20)
                expectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 5.0)
    }
    // teste verifica se o array de herois trazido pela requisição é igual a zero
    // o que representa uma falha
    
    func testFailureRequestBringEmptyData() {
        let expectation = self.expectation(description: "Failure")

        sut.getData(method: .GET) { result in
            switch result{
            case .failure(let error):
                XCTAssertTrue((error as ErrorCases) == ErrorCases.invalidData)
            case .success(_): break
                //then
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3.0)
    }
    
}
