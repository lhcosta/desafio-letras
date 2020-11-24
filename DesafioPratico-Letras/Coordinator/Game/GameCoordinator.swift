//
//  GameCoordinator.swift
//  DesafioPratico-Letras
//
//  Created by Lucas Costa  on 21/11/20.
//

import UIKit

class GameCoordinator: Coordinator {
    
    //MARK:- Properties
    weak var parentCoordinator: Coordinator?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    private let word: String
    
    //MARK:- Initializer
    init(navigationController:  UINavigationController = UINavigationController(), with word: String) {
        self.navigationController = navigationController
        self.word = word
    }
    
    //MARK:- Methods
    func start() {
        let viewController = GameViewController(viewModel: GameViewModel(word: word,
                                                                         gameService: GameService(dataService: DataService())))
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func didFinishPlaying() {
        parentCoordinator?.childDidFinish(self)
    }
    
}



