//
//  PortraitUserGuessTableViewCell.swift
//  Productivity Inside — Test
//
//  Created by Никита Белокриницкий on 01.02.2023.
//

import UIKit

/// Ячейка для угадывания пользователем числа компьютера, отображаемая при портретной ориентации интерфейса устройства.
class PortraitUserGuessTableViewCell: BaseUserGuessTableViewCell {
    var infoLabel = UILabel()
    
    override func setUpAndAddSubviews() {
        super.setUpAndAddSubviews()
        
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.textAlignment = .center
        infoLabel.font = UIFont.systemFont(ofSize: 18)
        infoLabel.text = "You are guessing"
        
        contentView.addSubview(infoLabel)
    }
    
    override func setUpConstraints() {
        NSLayoutConstraint.activate([
            tryLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor, constant: 100),
            tryLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 10),
            tryLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -10),
            
            infoLabel.topAnchor.constraint(equalTo: tryLabel.bottomAnchor, constant: 15),
            infoLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 10),
            infoLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -10),
            
            userNumberTextField.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 50),
            userNumberTextField.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 10),
            userNumberTextField.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -10),
            
            guessButton.topAnchor.constraint(equalTo: userNumberTextField.bottomAnchor, constant: 50),
            guessButton.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 10),
            guessButton.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -10),
            guessButton.heightAnchor.constraint(equalToConstant: 50),
            
            computerHintLabel.topAnchor.constraint(equalTo: guessButton.bottomAnchor, constant: 30),
            computerHintLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 10),
            computerHintLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -10),
            computerHintLabel.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor, constant: 20)
        ])
    }
}
