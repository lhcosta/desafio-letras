//
//  GameViewSpec.swift
//  DesafioPratico-LetrasTests
//
//  Created by Lucas Costa  on 20/11/20.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import DesafioPratico_Letras

class GameViewSpec: QuickSpec {
    
    override func spec() {
        
        describe("GameViewSpec") {
            
            var sut: GameView!
            
            context("First State") {
                beforeEach {
                    sut = GameView(frame: CGRect(origin: .zero, size: CGSize(width: 414, height: 800)))
                    sut.overLetters = "ABE"
                    sut.word = "CAVALO"
                    sut.point = 20
                    sut.backgroundColor = .white
                }
                
                it("Load View") {
//                    expect(sut).toEventually(recordSnapshot(named: "GameView"))
                    expect(sut).toEventually(haveValidSnapshot(named: "GameView"))
                }
            }
        }
    }
}
