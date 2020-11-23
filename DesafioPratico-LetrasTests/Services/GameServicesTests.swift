//
//  GameServicesTests.swift
//  DesafioPratico-LetrasTests
//
//  Created by Lucas Costa  on 21/11/20.
//

import XCTest

@testable import DesafioPratico_Letras

class GameServicesTests: XCTestCase {
    
    var sut: GameService!
    
    override func setUp() {
        super.setUp()
        sut = GameService(dataService: DataService())
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_calculatePointFromWord() {
        
        let word = "ABACAXI"
        let point = 18
        let exp = expectation(description: "Calculate point word")
        
        sut.calculatePointWord(word: word) { (value) in
            XCTAssertEqual(value, point)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1)
    }
    
    func test_findBestAnswerWithHigherPoint() {
        
        //Deixar - 14 pontos
        //Mandar - 9 pontos
        let answerWord = "DEIXAR"
        let letters = "aeixrdmna"
        let exp = expectation(description: "Find best word")
        
        sut.findBestAnswer(letters) { (answer) in
            XCTAssertEqual(answer?.word, answerWord)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1)
    }
    
    func test_findBestAnswerWithSmallerWordSize() {
        
        //Rota - 4 pontos
        //Dor - 4 pontos
        let answerWord = "DOR"
        let letters = "dtora"
        let exp = expectation(description: "Find best word")
        
        sut.findBestAnswer(letters) { (answer) in
            XCTAssertEqual(answer?.word, answerWord)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1)
    }
    
}
