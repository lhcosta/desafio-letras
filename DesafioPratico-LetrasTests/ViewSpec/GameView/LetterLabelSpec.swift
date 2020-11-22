//
//  LetterLabelSpec.swift
//  DesafioPratico-LetrasTests
//
//  Created by Lucas Costa  on 20/11/20.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import DesafioPratico_Letras

class LetterLabelSpec: QuickSpec {
    
    override func spec() {
        
        describe("LetterLabel") {
            
            var sut: LetterLabel!
            
            context("First State") {
                beforeEach {
                    sut = LetterLabel(frame: CGRect(origin: .zero, size: CGSize(width: 30, height: 30)))

                    sut.text = "A"
                }
                
                it("Load View") {
                    expect(sut).toEventually(recordSnapshot(named: "LetterLabel"))
//                    expect(sut).toEventually(haveValidSnapshot(named: "LetterLabel"))
                }
            }
        }
    }
}
