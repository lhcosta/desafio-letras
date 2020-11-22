//
//  KeyboardManager.swift
//  DesafioPratico-Letras
//
//  Created by Lucas Costa  on 20/11/20.
//

import UIKit

enum KeyboardState {
    case isShowing
    case isHidden
}

protocol KeyboardManagerDelegate: AnyObject {
    func keyboardChangeState(_ frame: CGRect)
}

class KeyboardManager: NSObject {
    
    var state: KeyboardState = .isHidden
    weak var delegate: KeyboardManagerDelegate?
    
    func registerNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func removeNotifications() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        if state != .isShowing {
            state = .isShowing
            delegate?.keyboardChangeState(keyboardSize.cgRectValue)
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        guard let keyboardSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        if state != .isHidden {
            state = .isHidden
            delegate?.keyboardChangeState(keyboardSize.cgRectValue)
        }
    }
    
}

