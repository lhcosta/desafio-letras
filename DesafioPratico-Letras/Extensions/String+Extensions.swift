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
        
        let firstWord = self.uppercased().sorted()
        let secondWord = string.uppercased().sorted()
        let difference = firstWord.difference(from: secondWord)
        
        let contains = difference.insertions.isEmpty
        var overElements: [String] = []
                
        difference.removals.forEach {
            switch $0 {
            case .remove(_, let element, _):
                overElements.append(String(element))
            default:
                break
            }
        }
        
        return (contains, overElements)
    }
    
}
