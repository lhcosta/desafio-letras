//
//  Coordinator.swift
//  DesafioPratico-Letras
//
//  Created by Lucas Costa  on 21/11/20.
//

import UIKit

protocol Coordinator: AnyObject {
    var parentCoordinator: Coordinator? { get }
    var navigationController: UINavigationController { get }
    var childCoordinators: [Coordinator] { get set }
    func start()
    func childDidFinish(_ child: Coordinator)
}

//MARK:- Default methods
extension Coordinator {
    
    /// Removendo child ao retornar
    /// - Parameter child: child para ser removido
    func childDidFinish(_ child: Coordinator) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}
