//
//  ViewPositionChangeable.swift
//  DesafioPratico-Letras
//
//  Created by Lucas Costa  on 23/11/20.
//

import UIKit

protocol ViewPositionChangeable: UIViewController, KeyboardManagerDelegate {
    var keyboardManager: KeyboardManager { get }
    var viewConstraint: NSLayoutConstraint? { get }
    var valueConstraintConstant: CGFloat { get }
    func keyboardChangeState(_ frame: CGRect)
}

//MARK:- Default implementations
extension ViewPositionChangeable {
    
    func keyboardChangeState(_ frame: CGRect) {
        DispatchQueue.main.async {
            
            if self.keyboardManager.state == .isShowing {
                self.viewConstraint?.constant = -frame.height
            } else {
                self.viewConstraint?.constant += frame.height
            }
            
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
}
