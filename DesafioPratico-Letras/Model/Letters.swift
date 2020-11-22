//
//  Letters.swift
//  DesafioPratico-Letras
//
//  Created by Lucas Costa  on 21/11/20.
//

import Foundation

struct Letters: Decodable {
    
    private(set) var dict: [String: Int]
    
    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        dict = try container.decode([String: Int].self)
    }
}

