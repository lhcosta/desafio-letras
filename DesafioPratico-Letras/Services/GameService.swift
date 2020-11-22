//
//  GameService.swift
//  DesafioPratico-Letras
//
//  Created by Lucas Costa  on 21/11/20.
//

import Foundation

enum GameServiceError: Error {
    case notFound
    case calculatePoint
}

class GameService {
    
    private let dataService: DataService
    private var words: Words?
    private var letters: Letters?
    
    init(dataService: DataService) {
        self.dataService = dataService
    }
    
    func findBestAnswer(_ letters: String, completion: @escaping (Result<Answer?, Error>) -> Void) {
        
        var bestAnswer: Answer?
        
        dataService.fetch(from: .words, type: Words.self) { (result) in
            switch result {
            case .success(let words):
                
                for word in words.values {
                    
                    let result = word.containsAllLetters(in: letters)
                    
                    if result.contains {
                        
                        self.calculatePointWord(word: word) { (point) in
                            
                            if bestAnswer?.point ?? 0 < point {
                                bestAnswer = Answer(word: word, point: point, overLetters: result.overElements)
                            } else if bestAnswer?.point ?? 0 == point && word.count < (bestAnswer?.word.count ?? 0) {
                                bestAnswer = Answer(word: word, point: point, overLetters: result.overElements)
                            }
    
                        }
                        
                    }
                    
                }
                
                completion(.success(bestAnswer))
            
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    /// Calculando a pontuação de uma palavra
    /// - Parameters:
    ///   - word: palavra a ser calculada.
    ///   - completion: pontuação final.
    func calculatePointWord(word: String, completion: @escaping (Int) -> Void) {
        
        if letters != nil {
            completion(sumLettersPoint(word))
        } else {
            dataService.fetch(from: .letters, type: Letters.self) { [weak self] (result) in
                switch result {
                case .success(let letters):
                    self?.letters = letters
                    completion(self?.sumLettersPoint(word) ?? 0)
                    
                case .failure(let error):
                    print("Error to fetch letters - \(error)")
                }
            }
        }
        
    }
}

//MARK:- Private methods
private extension GameService {
    
    /// Somando todas as letras de acordo com o seu valor.
    /// - Parameter word: palavra
    /// - Returns: valor final
    func sumLettersPoint(_ word: String) -> Int {
        return word.reduce(0, { point, letter in
            point + (self.letters?.dict[letter.description] ?? 0)
        })
    }
}

