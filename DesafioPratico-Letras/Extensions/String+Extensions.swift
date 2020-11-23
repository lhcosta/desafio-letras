//
//  Array+Extensions.swift
//  DesafioPratico-Letras
//
//  Created by Lucas Costa  on 21/11/20.
//

import Foundation

extension String {
        
    func containsAllLetters(in string: String) -> (contains: Bool, overElements: [String]) {
        
        guard string.count >= self.count else { return (false, []) }
        
        var firstWord = self.uppercased().map { String($0) }
        var secondWord = string.uppercased().map { String($0) }
        var contains = false
        var overElements: [String] = []
                
        while firstWord.count <= secondWord.count {
            
            let letter = secondWord.removeFirst()
            
            if let foundLetter = firstWord.enumerated().first(where: { $0.element == letter }) {
                firstWord.remove(at: foundLetter.offset)
            } else {
                overElements.append(String(letter))
            }
            
            if firstWord.isEmpty {
                contains.toggle()
                break
            }
        }
      
        overElements.append(contentsOf: secondWord)
        return (contains, overElements)
    }
    
}
