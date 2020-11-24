//
//  HomeViewController.swift
//  DesafioPratico-Letras
//
//  Created by Lucas Costa  on 20/11/20.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK:- Properties
    weak var coordinator: HomeCoordinator?
    
    lazy var keyboardManager: KeyboardManager = {
        let manager = KeyboardManager()
        manager.delegate = self
        return manager
    }()
        
    var homeView: HomeView {
        return view as! HomeView
    }

    override func loadView() {
        super.loadView()
        view = HomeView()
    }
    
    //MARK:- View lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        keyboardManager.registerNotifications()
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupClosures()
        setupNavigation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        keyboardManager.removeNotifications()
    }

}

//MARK:- Actions
extension HomeViewController {
    func goToGameView(send word: String) {
        coordinator?.goToGameView(send: word)
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
        navigationItem.title = Texts.navigationTitle.text
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor(named: "NavigationBarColor")
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }

}

//MARK:- Texts
extension HomeViewController {
    enum Texts {
        case navigationTitle
        
        var text: String {
            switch self {
            case .navigationTitle:
                return "Monta Palavras"
            }
        }
    }
}

//MARK:- ViewPositionChangeable
extension HomeViewController: ViewPositionChangeable {
    
    var viewConstraint: NSLayoutConstraint? {
        homeView.constraints.first(where: { $0.firstItem is InputLettersView && $0.firstAttribute == .bottom })
    }
    
    var valueConstraintConstant: CGFloat { -10 }
}


