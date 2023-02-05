//
//  File.swift
//  Productivity Inside — Test
//
//  Created by Никита Белокриницкий on 02.02.2023.
//

import UIKit

extension UITextField {
    /// Отбрасывает все вводимые пользователем данные, кроме цифр от 0 до 9.
    /// А так же позволяет пользователю вводить только целые числа из диапазона 1...100.
    /// Вызов этой функции необходимо поместить в метод textField(_:shouldChangeCharactersIn:replacementString:) делегата UITextFieldDelegate.
    /// - Parameters:
    ///   - textField: TextField в котором требуется проверка вводимых данных.
    ///   - range: Диапазон заменяемых символов.
    ///   - string: Строка замены для указанного диапазона.
    ///   - setEntryButtonToEnabled: Замыкание для управления состоянием кнопки отправки введенного значения. Включает кнопку только в том случае, если введенное число находится в диапазоне 1...100.
    ///   - delegate: Делегат UserGuessTableViewController'а, на котором представлен TextField. Вызывает методы, необходимые для сохранения введенных данных в модели ViewController'а.
    /// - Returns: Возвращает логическое значение: true, если указанный диапазон текста должен быть заменен; в противном случае — false, чтобы сохранить старый текст.
    static func allowOnlyIntsFrom1To100(in textField: UITextField,
                                        shouldChangeCharactersIn range: NSRange,
                                        replacementString string: String,
                                        setEntryButtonToEnabled: (_: Bool) -> (),
                                        delegate: UserGuessControllerDelegate? = nil) -> Bool {
        for char in string {
            // Отбрасываем любые вносимые изменения, если они содержат что-то помимо цифр (0-9)
            if !(char.isASCII && char.isNumber) { return false }
        }
        
        if var text = textField.text, let range = Range(range, in: text) {
            text.replaceSubrange(range, with: string)
            
            guard let number = Int(text) else {
                setEntryButtonToEnabled(false)
                delegate?.updateGuessButtonState(toEnabled: false)
                delegate?.updateUser(input: text)
                return true
            }
            
            setEntryButtonToEnabled(number > 0 && number <= 100)
            delegate?.updateGuessButtonState(toEnabled: number > 0 && number <= 100)
            delegate?.updateUser(input: text)
        }
        
        return true
    }
}
