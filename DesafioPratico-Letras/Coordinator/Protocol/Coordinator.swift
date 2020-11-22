//
//  Coordinator.swift
//  DesafioPratico-Letras
//
//  Created by Lucas Costa  on 21/11/20.
//

import UIKit

protocol Coordinator: AnyObject {
    var currentViewController: UIViewController? { get }
    var navigationController: UINavigationController { get }
    var childCoordinators: [Coordinator] { get set }
    func start()
}
