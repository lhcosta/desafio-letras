//
//  HomeCoordinator.swift
//  DesafioPratico-Letras
//
//  Created by Lucas Costa  on 21/11/20.
//

import UIKit

class HomeCoordinator: Coordinator {
    
    //MARK:- Properties
    weak var parentCoordinator: Coordinator?
    var currentViewController: UIViewController?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    //MARK:- Initializer
    init(navigationController:  UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
    }
    
    //MARK:- Methods
    func start() {
        let viewController = HomeViewController()
        viewController.coordinator = self
        currentViewController = viewController
        navigationController.pushViewController(viewController, animated: true)
    }
    
    /// Apresentado view de jogo.
    /// - Parameter word: palavra digitada.
    func goToGameView(send word: String) {
        let coordinator = GameCoordinator(navigationController: navigationController, with: word)
        coordinator.parentCoordinator = self
        childCoordinators.append(coordinator)
        coordinator.start()
    }
    
}




