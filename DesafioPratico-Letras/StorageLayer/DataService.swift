//
//  DataService.swift
//  DesafioPratico-Letras
//
//  Created by Lucas Costa  on 21/11/20.
//

import Foundation

enum DataServiceError: Error {
    case wrongURL
    case failToDecode
    case convertToData
}

protocol DataServiceProtocol {
    func fetch<Element: Decodable>(from file: JSONFiles, type: Element.Type, completion: @escaping (Result<Element, Error>) -> Void)
}

class DataService: DataServiceProtocol {
    
    func fetch<Element: Decodable>(from file: JSONFiles, type: Element.Type, completion: @escaping (Result<Element, Error>) -> Void) {
        
        guard let url = Bundle.main.url(forResource: file.rawValue, withExtension: "json") else {
            completion(.failure(DataServiceError.wrongURL))
            return
        }
        
        guard let data = try? Data(contentsOf: url) else {
            completion(.failure(DataServiceError.convertToData))
            return
        }
        
        let decoder = JSONDecoder()
        guard let element = try? decoder.decode(type, from: data) else {
            completion(.failure(DataServiceError.failToDecode))
            return
        }
        
        completion(.success(element))
    }
    
}


