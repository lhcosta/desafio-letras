//
//  ViewCodable.swift
//  DesafioPratico-Letras
//
//  Created by Lucas Costa  on 20/11/20.
//

import Foundation

//Protocolo base para criação de view por meio de view code
protocol ViewCodable {
    func setupViews()
    func setupConstraints()
    func setupViewHierarchy()
    func setupAdditionalConfiguration()
}

extension ViewCodable {
    
    func setupViews() {
        setupViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
    
    func setupAdditionalConfiguration(){}
}
