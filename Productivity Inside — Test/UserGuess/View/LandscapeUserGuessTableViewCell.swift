//
//  LandscapeUserGuessTableViewCell.swift
//  Productivity Inside — Test
//
//  Created by Никита Белокриницкий on 02.02.2023.
//

import UIKit

/// Ячейка для угадывания пользователем числа компьютера, отображаемая при ландшафтной ориентации интерфейса устройства.
class LandscapeUserGuessTableViewCell: BaseUserGuessTableViewCell {
    override func setUpConstraints() {
        NSLayoutConstraint.activate([
            tryLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor, constant: 12),
            tryLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 10),
            tryLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -10),
            
            userNumberTextField.topAnchor.constraint(equalTo: tryLabel.bottomAnchor, constant: 15),
            userNumberTextField.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 10),
            userNumberTextField.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -10),
            
            guessButton.topAnchor.constraint(equalTo: userNumberTextField.bottomAnchor, constant: 20),
            guessButton.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 10),
            guessButton.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -10),
            guessButton.heightAnchor.constraint(equalToConstant: 50),
            
            computerHintLabel.topAnchor.constraint(equalTo: guessButton.bottomAnchor, constant: 15),
            computerHintLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 10),
            computerHintLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -10),
            computerHintLabel.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor, constant: 12)
        ])
    }
    
    override func setTries(count: Int) {
        tryLabel.text = "Try № \(count) — You are Guessing"
    }
}
