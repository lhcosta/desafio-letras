//
//  OverLettersViewSpec.swift
//  DesafioPratico-LetrasTests
//
//  Created by Lucas Costa  on 20/11/20.
//
import Quick
import Nimble
import Nimble_Snapshots

@testable import DesafioPratico_Letras

class LettersViewSpec: QuickSpec {
    
    override func spec() {
        
        describe("OverLettersView") {
            
            var sut: LettersView!
            
            context("First State") {
                beforeEach {
                    sut = LettersView(frame: CGRect(origin: .zero, size: CGSize(width: 414, height: 100)))
                    sut.letters = ["A", "B", "C", "D"]
                }
                
                it("Load View") {
                    expect(sut).toEventually(recordSnapshot(named: "OverLettersView"))
//                    expect(sut).toEventually(haveValidSnapshot(named: "OverLettersView"))
                }
            }
        }
    }
}
