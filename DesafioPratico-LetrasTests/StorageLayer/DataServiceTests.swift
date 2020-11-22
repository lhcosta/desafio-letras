//
//  DataServiceTests.swift
//  DesafioPratico-LetrasTests
//
//  Created by Lucas Costa  on 21/11/20.
//

import XCTest

@testable import DesafioPratico_Letras

class DataServiceTests: XCTestCase {

    var sut: DataService!
    
    override func setUp() {
        super.setUp()
        sut = DataService()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    //MARK:- Test cases
    func test_fetchAllLetters() {
        
        let exp = expectation(description: "Fetch letters")
        
        sut.fetch(from: .letters, type: Letters.self) { (result) in
            switch result {
            case .success(let letters):
                XCTAssertFalse(letters.dict.isEmpty)
            case .failure(let error):
                XCTFail("Fail to fetch letters - \(error)")
            }
            
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1)
    }
    
    func test_fetchAllWords() {
        
        let exp = expectation(description: "Fetch words")
        
        sut.fetch(from: .words, type: Words.self) { (result) in
            switch result {
            case .success(let words):
                XCTAssertFalse(words.values.isEmpty)
            case .failure(let error):
                XCTFail("Fail to fetch words - \(error)")
            }
            
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1)
    }

    
    
}
