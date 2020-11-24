//
//  GameViewController.swift
//  DesafioPratico-Letras
//
//  Created by Lucas Costa  on 21/11/20.
//

import UIKit

class GameViewController: UIViewController {
    
    //MARK:- Properties
    weak var coordinator: GameCoordinator?
    private let viewModel: GameViewModel
    
    lazy var keyboardManager: KeyboardManager = {
        let manager = KeyboardManager()
        manager.delegate = self
        return manager
    }()
    
    //MARK:- Initializer
    init(viewModel: GameViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var gameView: GameView {
        view as! GameView
    }
    
    //MARK:- View lifecycle
    override func loadView() {
        super.loadView()
        view = GameView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateAnswer()
        keyboardManager.registerNotifications()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupClosures()
        setupNavigation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        coordinator?.didFinishPlaying()
        keyboardManager.removeNotifications()
    }
    
}

//MARK:- Private methods
private extension GameViewController {
    
    func updateAnswer() {
        viewModel.fetchAnswer { [weak self] in
            DispatchQueue.main.async {
                if let answer = self?.viewModel.answer {
                    self?.gameView.point = answer.point
                    self?.gameView.word = answer.word
                    self?.gameView.overLetters = answer.overLetters.joined()
                } else {
                    self?.showNotFoundWordAlert()
                }
            }
        }
    }
    
    func setupClosures() {
        gameView.inputLettersView.confirmButtonAction = { [weak self] text in
            self?.viewModel.word = text
            self?.updateAnswer()
        }
    }
    
    func setupNavigation() {
        navigationController?.navigationBar.tintColor = .white
        navigationItem.title = Texts.navigationTitle.text
    }
    
    func showNotFoundWordAlert() {
        let alert = UIAlertController(title: Texts.notFoundWordAlertTitle.text,
                                      message: Texts.notFoundWordAlertText.text,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Texts.notFoundWordAlertAction.text, style: .default))
        present(alert, animated: true)
    }
}


//MARK:- Texts
extension GameViewController {
    enum Texts {
        case notFoundWordAlertTitle
        case notFoundWordAlertText
        case notFoundWordAlertAction
        case navigationTitle
        
        var text: String {
            switch self {
            case .notFoundWordAlertText:
                return "Nenhuma palavra foi encontrada com as letras fornecidas"
            case .notFoundWordAlertTitle:
                return "Palavra não encontrada"
            case .notFoundWordAlertAction:
                return "OK"
            case .navigationTitle:
                return "Monta Palavras"
            }
        }
        
    }
}

//MARK:- ViewPositionChangeable
extension GameViewController: ViewPositionChangeable {
    var viewConstraint: NSLayoutConstraint? {
        gameView.constraints.first(where: { $0.firstItem is InputLettersView && $0.firstAttribute == .bottom })
    }

    var valueConstraintConstant: CGFloat { -10 }
}
