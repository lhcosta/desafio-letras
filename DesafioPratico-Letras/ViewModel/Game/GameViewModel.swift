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
    private let gameService: GameService
    
    init(word: String, gameService: GameService) {
        self.word = word
        self.gameService = gameService
    }
    
    func fetchAnswer(completion: @escaping () -> Void){
        gameService.findBestAnswer(word) { [weak self] (result) in
            switch result {
            case .success(let result):
                self?.answer = result
            case .failure(let error):
                print("Error to get best answer - \(error)")
            }
            
            completion()
        }
    }
}

