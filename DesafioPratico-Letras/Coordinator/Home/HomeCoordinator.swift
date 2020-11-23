//
//  HomeCoordinator.swift
//  DesafioPratico-Letras
//
//  Created by Lucas Costa  on 21/11/20.
//

import UIKit

class HomeCoordinator: Coordinator {
    
    var currentViewController: UIViewController?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    init(navigationController:  UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = HomeViewController()
        viewController.coordinator = self
        currentViewController = viewController
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func goToGameView(send word: String) {
        let coordinator = GameCoordinator(navigationController: navigationController, with: word)
        childCoordinators.append(coordinator)
        coordinator.start()
    }
    
}




