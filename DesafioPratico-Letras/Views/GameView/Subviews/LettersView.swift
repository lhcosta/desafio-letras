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
            
            for view in lettersStackView.arrangedSubviews {
                lettersStackView.removeArrangedSubview(view)
                view.removeFromSuperview()
            }
            
            letters.forEach {
                let letterLabel = LetterLabel()
                letterLabel.text = String($0)
                lettersStackView.addArrangedSubview(letterLabel)
            }
        }
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let lettersStackView: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 10
        stack.alignment = .fill
        stack.distribution = .fillEqually
        return stack
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
        stackView.addArrangedSubview(lettersStackView)
        addSubview(stackView)
    }
}
