//
//  ArrayExtensionsTests.swift
//  DesafioPratico-LetrasTests
//
//  Created by Lucas Costa  on 21/11/20.
//

import XCTest

@testable import DesafioPratico_Letras

class StringExtensionsTests: XCTestCase {
    
    func test_WhenArrayContainsAllElements() {
        
        let word = "Banana"
        let letters = "bnanaafg"
        let overElements = ["F", "G"]
        
        let result = word.containsAllLetters(in: letters)
        
        XCTAssertTrue(result.contains)
        XCTAssertEqual(result.overElements, overElements)
    }
    
    func test_WhenArrayNotContainsAllElements() {
        
        let word = "banana"
        let letters = "banan"
        
        let result = word.containsAllLetters(in: letters)
        
        XCTAssertFalse(result.contains)
        XCTAssertTrue(result.overElements.isEmpty)
    }
    
    func testPerformaceFindWord() {
                
        let word = "Banana"
        let letters = String(repeating: "mandar", count: 3000).appending("bnanaa")
        
        measure {
            _ = word.containsAllLetters(in: letters)
        }
    }
    

}
