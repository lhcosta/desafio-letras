//
//  InputLettersStackView.swift
//  DesafioPratico-Letras
//
//  Created by Lucas Costa  on 20/11/20.
//

import UIKit

class InputLettersView: UIView {
    
    var confirmButtonAction: ((String) -> Void)?
    
    //MARK:- Components
    private lazy var textField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Letras"
        textField.setContentHuggingPriority(.defaultLow, for: .horizontal)
        textField.borderStyle = .roundedRect
        textField.delegate = self
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.keyboardType = .alphabet
        textField.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
        return textField
    }()
    
    private lazy var confirmButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("OK", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.isEnabled = false
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 2
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(clickOnConfirmButton), for: .touchUpInside)
        return button
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 20
        return stackView
    }()
    
    private lazy var keyboardManager: KeyboardManager = {
        let manager = KeyboardManager()
        manager.delegate = self
        return manager
    }()
    
    
    //MARK:- Initializer
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViews()
        keyboardManager.registerNotifications()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        keyboardManager.removeNotifications()
    }
    
}

//MARK:- UIButton Actions
extension InputLettersView {
    @objc func clickOnConfirmButton() {
        if let text = textField.text {
            confirmButtonAction?(text)
            textField.text = ""
            confirmButton.isEnabled = false
            confirmButton.backgroundColor = .systemGray
        }
    }
}

//MARK:- UITextFieldDelegate
extension InputLettersView: UITextFieldDelegate {
    
    //Habilitando o botão apenas quando não está vazio
    @objc func textDidChange(_ textField: UITextField) {
        if !(textField.text?.isEmpty ?? false) {
            confirmButton.isEnabled = true
            confirmButton.backgroundColor = .systemBlue
        } else {
            confirmButton.isEnabled = false
            confirmButton.backgroundColor = .systemGray
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        //Permitindo backspace e letras
        guard string.isEmpty || string.rangeOfCharacter(from: .letters) != nil else { return false }
        
        //Permitindo apenas 25 caracteres
        guard let newText = textField.text as NSString?,
              newText.replacingCharacters(in: range, with: string).count <= 25 else { return false }
                
        return true
    }
    
}

//MARK:- ViewCodable
extension InputLettersView: ViewCodable {
    
    func setupViewHierarchy() {
        stackView.addArrangedSubview(textField)
        stackView.addArrangedSubview(confirmButton)
        addSubview(stackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            confirmButton.widthAnchor.constraint(equalToConstant: 50),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}

//MARK:- KeyboardManagerDelegate
extension InputLettersView: KeyboardManagerDelegate {
    func keyboardChangeState(_ frame: CGRect) {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear) {
                let constraint = self.superview?.constraints.first(where: {
                    $0.firstItem is InputLettersView && $0.firstAttribute == .bottom
                })
                
                if self.keyboardManager.state == .isShowing {
                    constraint?.constant -= frame.height
                } else {
                    constraint?.constant += frame.height
                }
                
                self.superview?.layoutIfNeeded()
            }
        }
    }
}
