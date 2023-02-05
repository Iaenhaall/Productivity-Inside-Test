//
//  UserGuessModel.swift
//  Productivity Inside — Test
//
//  Created by Никита Белокриницкий on 04.02.2023.
//

import Foundation

/// Модель данных для угадывания пользователем числа, загаданного компьютером.
struct NumberGuessingByUser {
    let number: Int
    private(set) var tries = 0
    private(set) var state: GuessingState? = nil
    
    init(range: ClosedRange<Int>) {
        number = Int.random(in: range)
    }
    
    /// Сравнивает загаданное компьютером и предложенное пользователем числа.
    /// - Parameter userNumber: Предложенное пользователем число.
    /// - Returns: Результат сравнения.
    mutating func compareComputerNumber(with userNumber: Int) -> GuessingState {
        if state == .equal { return state! }
        
        tries += 1
        
        if number == userNumber {
            state = .equal
        } else {
            state = number > userNumber ? .greater : .less
        }
        
        return state!
    }
}
