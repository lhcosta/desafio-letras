//
//  HomeViewSpec.swift
//  DesafioPratico-LetrasTests
//
//  Created by Lucas Costa  on 22/11/20.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import DesafioPratico_Letras

class HomeViewSpec: QuickSpec {
    
    override func spec() {
        
        describe("HomeViewSpec") {
            
            var sut: HomeView!
            
            context("First State") {
                beforeEach {
                    sut = HomeView()
                    sut.frame.size = CGSize(width: 414, height: 800)
                    sut.backgroundColor = .white
                }
                
                it("Load View") {
//                    expect(sut).toEventually(recordSnapshot(named: "HomeView"))
                    expect(sut).toEventually(haveValidSnapshot(named: "HomeView"))
                }
            }
        }
    }
}
