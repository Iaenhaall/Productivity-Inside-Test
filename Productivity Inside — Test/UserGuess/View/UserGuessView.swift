//
//  UserGuessView.swift
//  Productivity Inside — Test
//
//  Created by Никита Белокриницкий on 04.02.2023.
//

import UIKit

class UserGuessView: UIView {
    // Используется табличное представление, чтобы гарантировать, что даже на устройствах
    // с маленьким размером экрана пользователь сможет получить доступ ко всем элементам UI.
    @IBOutlet weak var tableView: UITableView!
    
    /// Настраивает View для корректного отображения пользователю.
    /// - Parameter delegate: Делегат, ответственный за отображение необходимых ячеек в таблице.
    func configure(with delegate: UITableViewDelegate & UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = delegate
        tableView.register(PortraitUserGuessTableViewCell.self, forCellReuseIdentifier: "PortraitUserGuessTableViewCell")
        tableView.register(LandscapeUserGuessTableViewCell.self, forCellReuseIdentifier: "LandscapeUserGuessTableViewCell")
    }
}
