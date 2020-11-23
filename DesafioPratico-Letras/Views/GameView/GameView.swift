//
//  GameView.swift
//  DesafioPratico-Letras
//
//  Created by Lucas Costa  on 20/11/20.
//

import UIKit

enum GameViewState {
    case notFoundWord
    case playing
}

class GameView: UIView {
    
    var word: String = "" {
        didSet {
            wordWithPointView.letters = word
        }
    }
    
    var point: Int = 0 {
        didSet {
            wordWithPointView.title = "Palavra de \(point) pontos"
        }
    }
    
    var overLetters: String = "" {
        didSet {
            overLettersView.letters = overLetters
        }
    }
    
    //MARK:- Components
    private let wordWithPointView: LettersView = {
       let view = LettersView()
        view.translatesAutoresizingMaskIntoConstraints = false
       return view
    }()
    
    private let overLettersView: LettersView = {
       let view = LettersView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.title = "Sobraram:"
       return view
    }()
    
    private(set) var inputLettersView: InputLettersView = {
       let input = InputLettersView()
        input.translatesAutoresizingMaskIntoConstraints = false
        return input
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 50
        return stack
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//MARK:- View Codable
extension GameView: ViewCodable {
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            inputLettersView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            inputLettersView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            inputLettersView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -15),
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 90),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    func setupViewHierarchy() {
        stackView.addArrangedSubview(wordWithPointView)
        stackView.addArrangedSubview(overLettersView)
        addSubview(stackView)
        addSubview(inputLettersView)
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .white
    }
    
}
