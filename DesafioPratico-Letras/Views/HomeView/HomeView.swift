//
//  HomeView.swift
//  DesafioPratico-Letras
//
//  Created by Lucas Costa  on 20/11/20.
//

import UIKit

class HomeView: UIView {
    
    //MARK:- Components
    private let text: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Digite as letras disponíveis nesta jogada"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 30)
        return label
    }()
    
    private(set) var inputLettersView: InputLettersView = {
       let input = InputLettersView()
        input.translatesAutoresizingMaskIntoConstraints = false
        return input
    }()
        
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViews()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//MARK:- ViewCodable
extension HomeView: ViewCodable {
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            inputLettersView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            inputLettersView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            inputLettersView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -15),
            text.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            text.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            text.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 90)
        ])
    }
    
    func setupViewHierarchy() {
        addSubview(text)
        addSubview(inputLettersView)
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .white
    }
    
}

