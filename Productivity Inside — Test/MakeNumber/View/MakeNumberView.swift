//
//  MakeNumberView.swift
//  Productivity Inside — Test
//
//  Created by Никита Белокриницкий on 04.02.2023.
//

import UIKit

class MakeNumberView: UIView {
    @IBOutlet weak var userNumberTextField: UITextField!
    @IBOutlet weak var enterNumberButton: UIButton!
    
    @IBOutlet weak var userNumberTextFieldTopAnchor: NSLayoutConstraint!
    private var enterNumberButtonBottomAnchor: NSLayoutConstraint!
    
    /// Настраивает View для корректного отображения пользователю.
    /// - Parameter delegate: Делегат, ответственный за корректность введенных пользователем данных.
    func configure(with delegate: UITextFieldDelegate) {
        userNumberTextField.delegate = delegate
        enterNumberButton.isEnabled = false
        
        enterNumberButtonBottomAnchor = enterNumberButton.bottomAnchor.constraint(equalTo: self.keyboardLayoutGuide.topAnchor, constant: -50)
        NSLayoutConstraint.activate([enterNumberButtonBottomAnchor])
    }
    
    /// Обновляет нужные Constraints для корректного отображения всех элементов UI в зависимости от ориентации интерфейса.
    func changeConstraints() {
        if UIApplication.shared.connectedScenes.compactMap({($0 as? UIWindowScene)?.keyWindow}).first?.windowScene?.interfaceOrientation.isLandscape ?? false {
            userNumberTextFieldTopAnchor.constant = 30
            enterNumberButtonBottomAnchor.constant = -15
        } else {
            userNumberTextFieldTopAnchor.constant = 100
            enterNumberButtonBottomAnchor.constant = -50
        }
    }
    
    /// Включает/Выключает кнопку ввода числа пользователя.
    /// - Parameter isEnabled: True, если кнопка должна быть активна; в противном случае — false.
    func setEnterNumberButtonState(toEnabled isEnabled: Bool) {
        enterNumberButton.isEnabled = isEnabled
    }
}
