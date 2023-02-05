//
//  BaseUserGuessTableViewCell.swift
//  Productivity Inside — Test
//
//  Created by Никита Белокриницкий on 03.02.2023.
//

import UIKit

/// Базовая ячейка для угадывания пользователем числа компьютера.
/// Используется как суперкласс для портретных и ландшафтных ячеек.
class BaseUserGuessTableViewCell: UITableViewCell {
    var tryLabel = UILabel()
    var userNumberTextField = UITextField()
    var guessButton = MainButton()
    var computerHintLabel = UILabel()
    
    private var delegate: UserGuessControllerDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpAndAddSubviews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Программно настраивает и добавляет необходимые элементы UI на ячейку.
    func setUpAndAddSubviews() {
        tryLabel.translatesAutoresizingMaskIntoConstraints = false
        tryLabel.textAlignment = .center
        tryLabel.font = UIFont.systemFont(ofSize: 18)
        
        userNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        userNumberTextField.textAlignment = .center
        userNumberTextField.font = UIFont.systemFont(ofSize: 18)
        userNumberTextField.placeholder = "Guess the Number"
        userNumberTextField.keyboardType = .numberPad
        userNumberTextField.borderStyle = .roundedRect
        
        guessButton.translatesAutoresizingMaskIntoConstraints = false
        guessButton.isEnabled = false
        guessButton.setTitle("Guess", for: .normal)
        guessButton.addTarget(self, action: #selector(guessButtonTapped), for: .touchUpInside)
        
        computerHintLabel.translatesAutoresizingMaskIntoConstraints = false
        computerHintLabel.textAlignment = .center
        computerHintLabel.font = UIFont.systemFont(ofSize: 18)
        computerHintLabel.text = " "
        
        contentView.addSubview(tryLabel)
        contentView.addSubview(userNumberTextField)
        contentView.addSubview(guessButton)
        contentView.addSubview(computerHintLabel)
    }
    
    @objc func guessButtonTapped(_ sender: UIButton) {
        delegate?.checkUserInput()
    }
    
    /// Устанавливает необходимые Constraints для правильного позиционирования элементов UI на ячейке.
    /// Каждый наследник должен переопределить этот метод исходя из своих задач.
    func setUpConstraints() {
        fatalError("This method must be overridden by a subclass.")
    }
    
    /// Назначает делегата ответственного за корректную обработку вводимых пользователем данных и их последующую передачу в контроллер.
    /// - Parameter delegate: Делегат.
    func setDelegate(_ delegate: UITextFieldDelegate & UserGuessControllerDelegate) {
        self.delegate = delegate
        userNumberTextField.delegate = delegate
    }
    
    /// Выводит на экран количество попыток пользователя.
    /// - Parameter count: Количество попыток.
    func setTries(count: Int) {
        tryLabel.text = "Try № \(count)"
    }
    
    /// Заполняет TextField данными, ранее введенными пользователем.
    /// - Parameter input: Строка ранее введенная пользователем.
    func setUser(input: String) {
        userNumberTextField.text = input
    }
    
    /// Включает/Выключает кнопку проверки введенного пользователем числа.
    /// - Parameter isEnabled: True, если кнопка должна быть активна; в противном случае — false.
    func setGuessButtonState(toEnabled isEnabled: Bool) {
        guessButton.isEnabled = isEnabled
    }
    
    /// Выводит результат сравнения загаданного компьютером и предполагаемого пользователем чисел.
    /// - Parameter hint: Результат сравнения.
    func setComputer(hint: GuessingState) {
        if hint == .equal { return }

        computerHintLabel.text = "No, my number is \(hint.rawValue) than yours"
        
        // Скрывает ответ компьютера через 1.5 секунды, так как при серии одинаковых результатов сравнения
        // чисел у пользователя может возникнуть ощущение, что программа не работает.
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.computerHintLabel.text = " "
        }
    }
}
