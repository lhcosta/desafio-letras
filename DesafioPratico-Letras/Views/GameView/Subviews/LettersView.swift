//
//  OverLettersView.swift
//  DesafioPratico-Letras
//
//  Created by Lucas Costa  on 20/11/20.
//

import UIKit

class LettersView: UIView {
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    var letters: String = "" {
        didSet {
            createLettersView()
        }
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    private let stackView: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .leading
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

//MARK:- ViewCodable
extension LettersView: ViewCodable {
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func setupViewHierarchy() {
        stackView.addArrangedSubview(titleLabel)
        addSubview(stackView)
    }
}

//MARK:- Private methods
private extension LettersView {
    
    func createLettersView() {
        //Removendo letras quando atualizar palavra.
        for view in stackView.arrangedSubviews {
            if let lettersStackView = view as? LettersStackView {
                stackView.removeArrangedSubview(lettersStackView)
                lettersStackView.removeFromSuperview()
            }
        }
        
        //Calculando o espaço disponível na tela e criando multiplas linhas de letras
        let availableSpace = UIScreen.main.bounds.size.width
        let labelPerRow = Int(availableSpace/40)
        
        var lettersStackView = LettersStackView()
        stackView.addArrangedSubview(lettersStackView)
        
        var count = 0
        for letter in letters {
            
            let label = LetterLabel()
            label.text = String(letter)
            
            if count < labelPerRow {
                count += 1
                lettersStackView.addArrangedSubview(label)
            } else {
                count = 0
                lettersStackView = LettersStackView()
                lettersStackView.addArrangedSubview(label)
                stackView.addArrangedSubview(lettersStackView)
            }
        }
    }
}

//MARK:- NestedTypes
extension LettersView {
    
    class LettersStackView: UIStackView {
        
        override init(frame: CGRect = .zero) {
            super.init(frame: frame)
            axis = .horizontal
            spacing = 8
            alignment = .fill
            distribution = .fillEqually
            translatesAutoresizingMaskIntoConstraints = false
        }
        
        required init(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}
