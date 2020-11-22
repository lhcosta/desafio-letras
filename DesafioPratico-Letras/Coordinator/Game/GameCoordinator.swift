//
//  GameCoordinator.swift
//  DesafioPratico-Letras
//
//  Created by Lucas Costa  on 21/11/20.
//

import UIKit

class GameCoordinator: Coordinator {
    
    var currentViewController: UIViewController?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    private let word: String
    
    init(navigationController:  UINavigationController = UINavigationController(), with word: String) {
        self.navigationController = navigationController
        self.word = word
    }
    
    func start() {
        let viewController = GameViewController(viewModel: GameViewModel(word: word,
                                                                         gameService: GameService(dataService: DataService())))
        currentViewController = viewController
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
        
}



