//
//  UserGuessControllerDelegate.swift
//  Productivity Inside — Test
//
//  Created by Никита Белокриницкий on 04.02.2023.
//

/// Протокол делегата для передачи и сохранения значений из BaseUserGuessTableViewCell в UserGuessTableViewController.
protocol UserGuessControllerDelegate {
    /// Сохраняет введенные пользователем данные.
    /// - Parameter input: Введенная пользователем строка.
    func updateUser(input: String)
    /// Сохраняет состояние кнопки проверки введенного числа.
    /// - Parameter isEnabled: True, если кнопка должна быть активна; в противном случае — false.
    func updateGuessButtonState(toEnabled isEnabled: Bool)
    /// Проверяет на равенство введенное пользователем и загаданное компьютером числа.
    /// Завершает или продолжает игру в зависимости от результата.
    func checkUserInput()
}
