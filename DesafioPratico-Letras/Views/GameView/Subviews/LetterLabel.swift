//
//  LetterView.swift
//  DesafioPratico-Letras
//
//  Created by Lucas Costa  on 20/11/20.
//

import UIKit

class LetterLabel: UILabel {

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)        
        clipsToBounds = true
        layer.cornerRadius = 5
        backgroundColor = .clear
        textAlignment = .center
        layer.borderWidth = 2
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 35),
            heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
}

