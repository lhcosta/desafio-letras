//
//  GameViewController.swift
//  DesafioPratico-Letras
//
//  Created by Lucas Costa  on 21/11/20.
//

import UIKit

class GameViewController: UIViewController {
    
    weak var coordinator: GameCoordinator?
    private let viewModel: GameViewModel
    
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
    
    override func loadView() {
        super.loadView()
        view = GameView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateAnswer()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupClosures()
        setupNavigation()
    }
    
}

//MARK:- Private methods
private extension GameViewController {
    
    func updateAnswer() {
        viewModel.fetchAnswer { [weak self] in
            DispatchQueue.main.async {
                guard let answer = self?.viewModel.answer else { return }
                self?.gameView.point = answer.point
                self?.gameView.word = answer.word
                self?.gameView.overLetters = answer.overLetters.joined()
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
        navigationItem.title = "Monta Palavras"
        navigationItem.hidesBackButton = true
    }
}
