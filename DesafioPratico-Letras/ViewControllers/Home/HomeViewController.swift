//
//  HomeViewController.swift
//  DesafioPratico-Letras
//
//  Created by Lucas Costa  on 20/11/20.
//

import UIKit

class HomeViewController: UIViewController {
    
    weak var coordinator: HomeCoordinator?
        
    var homeView: HomeView {
        return view as! HomeView
    }

    override func loadView() {
        super.loadView()
        view = HomeView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupClosures()
        setupNavigation()
    }
}

//MARK:- Actions
extension HomeViewController {
    func goToGameView(send word: String?) {
        coordinator?.goToGameView(send: word ?? "")
    }
}

//MARK:- Auxiliary methods
private extension HomeViewController {
    func setupClosures() {
        homeView.inputLettersView.confirmButtonAction = { [weak self] text in
            self?.goToGameView(send: text)
        }
    }
    
    func setupNavigation() {
        navigationItem.title = "Monta Palavras"
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor(named: "NavigationBarColor")
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }

}


