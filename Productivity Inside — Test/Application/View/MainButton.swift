//
//  MainButton.swift
//  Productivity Inside — Test
//
//  Created by Никита Белокриницкий on 31.01.2023.
//

import UIKit

/// Класс для определения внешнего вида основных кнопок.
final class MainButton: UIButton {
    private var defaultBackgroundColor = UIColor(named: "MainButtonBackgroundColor")
    private var disabledBackgroundColor = UIColor(named: "MainButtonBackgroundColor")?.withAlphaComponent(0.5)
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                self.backgroundColor = defaultBackgroundColor
            }
            else {
                self.backgroundColor = disabledBackgroundColor
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.clipsToBounds = true
        self.layer.cornerRadius = self.bounds.height / 3.0
        self.titleLabel?.textColor = .white
    }
}
