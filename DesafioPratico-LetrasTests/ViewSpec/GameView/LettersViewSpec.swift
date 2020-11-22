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
        
        describe("LettersViewSpec") {
            
            var sut: LettersView!
            
            context("First State") {
                beforeEach {
                    sut = LettersView(frame: CGRect(origin: .zero, size: CGSize(width: 414, height: 100)))
                    sut.letters = ["A", "B", "C", "D"]
                }
                
                it("Word with points") {
                    sut.title = "Palavra de 9 pontos"
                    expect(sut).toEventually(recordSnapshot(named: "LettersViewSpec_WordWithPoint"))
//                    expect(sut).toEventually(haveValidSnapshot(named: "LettersViewSpec_WordWithPoint"))
                }
                
                it("Over Letters") {
                    sut.title = "Sobraram:"
                    expect(sut).toEventually(recordSnapshot(named: "LettersViewSpec_OverLetters"))
//                    expect(sut).toEventually(haveValidSnapshot(named: "LettersViewSpec_OverLetters"))
                }
            }
        }
    }
}
