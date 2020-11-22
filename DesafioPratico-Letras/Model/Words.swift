//
//  Words.swift
//  DesafioPratico-Letras
//
//  Created by Lucas Costa  on 21/11/20.
//

import Foundation

struct Words: Decodable {
    
    private(set) var values: [String]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let words = try container.decode([String].self)
        
        //Removendo acentos e colocando em maiúsculo
        values = words.map({ $0.folding(options: .diacriticInsensitive, locale: .current).uppercased() })
    }
    
}
