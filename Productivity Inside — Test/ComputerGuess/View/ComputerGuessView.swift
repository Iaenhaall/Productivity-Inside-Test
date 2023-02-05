//
//  ComputerGuessView.swift
//  Productivity Inside — Test
//
//  Created by Никита Белокриницкий on 04.02.2023.
//

import UIKit

class ComputerGuessView: UIView {
    @IBOutlet weak var tryLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var greaterButton: UIButton!
    @IBOutlet weak var lessButton: UIButton!
    
    @IBOutlet weak var tryLabelTopAnchor: NSLayoutConstraint!
    @IBOutlet weak var buttonStackBottomAnchor: NSLayoutConstraint!
    
    /// Обновляет нужные Constraints для корректного отображения всех элементов UI в зависимости от ориентации интерфейса.
    func changeConstraints() {
        if UIApplication.shared.connectedScenes.compactMap({($0 as? UIWindowScene)?.keyWindow}).first?.windowScene?.interfaceOrientation.isLandscape ?? false {
            tryLabelTopAnchor.constant = 30
            buttonStackBottomAnchor.constant = 30
        } else {
            tryLabelTopAnchor.constant = 100
            buttonStackBottomAnchor.constant = 50
        }
    }
    
    /// Обновляет данные о состоянии игры.
    /// - Parameters:
    ///   - computerTries: Количество попыток компьютера угадать число пользователя.
    ///   - guessedNumber: Предполагаемое компьютером число.
    ///   - disableGreaterButton: True, если требуется выключить кнопку "Больше"; в противном случае — false.
    ///   - disableLessButton: True, если требуется выключить кнопку "Меньше"; в противном случае — false.
    func updateGameState(computerTries: Int, guessedNumber: Int, disableGreaterButton: Bool, disableLessButton: Bool) {
        tryLabel.text = "Try № \(computerTries)"
        numberLabel.text = "Your number is - \(guessedNumber)?"
        
        greaterButton.isEnabled = !disableGreaterButton
        lessButton.isEnabled = !disableLessButton
    }
}
