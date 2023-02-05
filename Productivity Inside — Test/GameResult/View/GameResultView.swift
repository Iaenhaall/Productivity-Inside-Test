//
//  GameResultView.swift
//  Productivity Inside — Test
//
//  Created by Никита Белокриницкий on 05.02.2023.
//

import UIKit

class GameResultView: UIView {
    @IBOutlet weak var userTriesCountLabel: UILabel!
    @IBOutlet weak var computerTriesCountLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var scoresLabelTopAnchor: NSLayoutConstraint!
    @IBOutlet weak var userTriesCountLabelTopAnchor: NSLayoutConstraint!
    @IBOutlet weak var resultLabelBottonAnchor: NSLayoutConstraint!
    @IBOutlet weak var mainMenuButtonBottomAnchor: NSLayoutConstraint!
    
    /// Настраивает View для корректного отображения пользователю.
    /// - Parameters:
    ///   - userTries: Количество попыток пользователя.
    ///   - computerTries: Количество попыток компьютера.
    ///   - result: Строка с результатом игры.
    func configure(userTries: Int, computerTries: Int, result: String) {
        userTriesCountLabel.text = "Your's tries count: \(userTries)"
        computerTriesCountLabel.text = "Computer's tries count: \(computerTries)"
        resultLabel.text = result
    }
    
    /// Обновляет нужные Constraints для корректного отображения всех элементов UI в зависимости от ориентации интерфейса.
    func changeConstraints() {
        if UIApplication.shared.connectedScenes.compactMap({($0 as? UIWindowScene)?.keyWindow}).first?.windowScene?.interfaceOrientation.isLandscape ?? false {
            scoresLabelTopAnchor.constant = 20
            userTriesCountLabelTopAnchor.constant = 30
            resultLabelBottonAnchor.constant = 20
            mainMenuButtonBottomAnchor.constant = 20
        } else {
            scoresLabelTopAnchor.constant = 100
            userTriesCountLabelTopAnchor.constant = 100
            resultLabelBottonAnchor.constant = 50
            mainMenuButtonBottomAnchor.constant = 50
        }
    }
}
