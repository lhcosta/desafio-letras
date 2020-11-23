//
//  GameService.swift
//  DesafioPratico-Letras
//
//  Created by Lucas Costa  on 21/11/20.
//

import Foundation

protocol GameServiceProtocol {
    func findBestAnswer(_ letters: String, completion: @escaping (Answer?) -> Void)
    func calculatePointWord(word: String, completion: @escaping (Int) -> Void)
}

class GameService: GameServiceProtocol {
    
    private let dataService: DataServiceProtocol
    private var words: Words?
    private var letters: Letters?
    
    init(dataService: DataServiceProtocol) {
        self.dataService = dataService
    }
    
    /// Encontrar a melhor palavra de acordo com a letras fornecidas pelo usuário.
    /// - Parameters:
    ///   - letters: letras digitadas
    ///   - completion: resposta válida ou não.
    func findBestAnswer(_ letters: String, completion: @escaping (Answer?) -> Void) {
        
        var bestAnswer: Answer?
        let group = DispatchGroup()
        group.enter()
        
        if self.words == nil {
            self.fetchWords { group.leave() }
        } else {
            group.leave()
        }
        
        group.notify(queue: .global()) {
            
            for word in self.words?.values ?? [] {
                
                let result = word.containsAllLetters(in: letters)
                
                if result.contains {
                    
                    self.calculatePointWord(word: word) { (point) in
                        
                        if let answer = bestAnswer {
                            if answer.point < point || (answer.point == point && word.count < answer.word.count)  {
                                bestAnswer = Answer(word: word, point: point, overLetters: result.overElements)
                            }
                        } else {
                            bestAnswer = Answer(word: word, point: point, overLetters: result.overElements)
                        }
                    }
                }
            }
            
            completion(bestAnswer)
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
    
    /// Buscando todas as palavras salvas.
    /// - Parameter completion: busca das palavras concluida.
    func fetchWords(completion: @escaping () -> Void) {
        dataService.fetch(from: .words, type: Words.self) { [weak self] result in
            switch result {
            case .success(let words):
                self?.words = words
            case .failure(let error):
                print("Error to fetch all words - \(error)")
            }
            
            completion()
        }
    }
}

