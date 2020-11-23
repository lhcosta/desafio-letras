//
//  GameViewModel.swift
//  DesafioPratico-Letras
//
//  Created by Lucas Costa  on 21/11/20.
//

import Foundation

class GameViewModel {
    
    var word: String
    private(set) var answer: Answer?
    private let gameService: GameServiceProtocol
    
    init(word: String, gameService: GameServiceProtocol) {
        self.word = word
        self.gameService = gameService
    }
    
    func fetchAnswer(completion: @escaping () -> Void){
        gameService.findBestAnswer(word) { [weak self] (answer) in
            self?.answer = answer
            completion()
        }
    }
}

